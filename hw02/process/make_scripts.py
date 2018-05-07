import subprocess
import os
import argparse
import numpy as np

# Main function
def main():
    # Parse command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("host", type=str, help="The host to run on")
    parser.add_argument("num_nodes", type=int, help="The number of nodes to run on")
    parser.add_argument("--method", required=False, default="linear", help="The method to use for load balancing. Default=linear")
    args = parser.parse_args()

    # Number of nodes to run on
    num_nodes = args.num_nodes
    # The host to request
    host = args.host
    # The load balancing method to use
    method = args.method

    # The blender file with frames to animate
    file_name = "Star-collapse-ntsc.blend"   

    # Header information for sbatch scripts
    header_lines = ['#!/bin/bash']
    out_file = '#SBATCH --output={}'
    error_file = '#SBATCH --error={}'
    job_name = '#SBATCH --job-name="{0}-{1}"'
    # The possible nodes these jobs could be run on
    hosts = ['hermes[1-4]', 'trillian[1-3]', 'artemis[1-7]', 'qdata[1-8]', 'granger[1-8]', 'nibbler[1-4]', 'slurm[1-5]', 'ai[01-06]']
    
    # Pick out just the host we requested
    exclude_list = [e for e in hosts if host not in e]
    
    # Exlcude all hosts we didn't request
    exclude_line = "#SBATCH --exclude={0}".format(",".join(exclude_list))
    
    # Name of the script file to write commands out to
    script_file = 'slurm_{0}_{1}_{2}.sh'

    # Commands we want to run
    time_command = 'date +%s%N'
    hostname_command = 'hostname'
    blender_command = 'time blender -t 1 -b {0} -s {1} -e {2} -a &> /dev/null'

    # The total number of frames in the blender file
    max_frames = 250

    if method == 'linear':
        # Make a new directory for all of the scripts and output
        if not os.path.exists(os.path.join(host, "{}_nodes".format(num_nodes))):
            os.makedirs(os.path.join(host, "{}_nodes".format(num_nodes)))

        for i in range(num_nodes): 
            # Assign frames to each node
            # Linear assignment: each node gets 250 / num_nodes frames, each in an adjacent chunk of frames
            lower = i * max_frames / num_nodes + 1
            upper = (i + 1) * max_frames / num_nodes
           
            # Add all lines to the script
            script_lines = [l for l in header_lines]
            script_lines.append(exclude_line)
            script_lines.append(out_file.format(os.path.join(host, "{}_nodes".format(num_nodes), "script_{}_{}_{}.out".format(i, lower, upper))))
            script_lines.append(error_file.format(os.path.join(host, "{}_nodes".format(num_nodes), "script_{}_{}_{}.err".format(i, lower, upper))))
            
            script_lines.append(job_name.format(lower, upper))

            script_lines.append(hostname_command)
            script_lines.append(time_command)
            script_lines.append(blender_command.format(file_name, lower, upper))
            script_lines.append(time_command)

            # Write out the script
            out = open(os.path.join(host, "{}_nodes".format(num_nodes), script_file.format(i, lower, upper)), 'w')
            for l in script_lines:
                out.write(l + '\n')
            out.close()

        # Start all jobs
        procs = []
        for i in range(num_nodes):
            lower = i * max_frames / num_nodes + 1
            upper = (i + 1) * max_frames / num_nodes
            procs.append(subprocess.Popen(['sbatch', os.path.join(host, "{}_nodes".format(num_nodes), script_file.format(i, lower, upper))]))
    
    elif method == 'interleave':
        # Make a new directory for all of the scripts and output
        if not os.path.exists(os.path.join(host, "{}_nodes_{}".format(num_nodes, method))):
            os.makedirs(os.path.join(host, "{}_nodes_{}".format(num_nodes, method)))

        for i in range(num_nodes):
            # Specify the frames for each node
            # Interleave: the i^th node gets every i^th frame: for 10 nodes, node 1 gets frame 1, 11, 21, 31, ...
            frames = np.arange(i + 1, 251, num_nodes)
            # lower, upper only for uniquely naming each script
            lower, upper = frames[0], frames[0]

            # Add all lines to the script
            script_lines = [l for l in header_lines]
            script_lines.append(exclude_line)
            script_lines.append(out_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.out".format(i, lower, upper))))
            script_lines.append(error_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.err".format(i, lower, upper))))
            
            script_lines.append(job_name.format(lower, upper))

            script_lines.append(hostname_command)
            script_lines.append(time_command)

            # Create blender command for each frame
            for frame in frames:
                script_lines.append(blender_command.format(file_name, frame, frame))

            script_lines.append(time_command)

            # Write out the script
            out = open(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper)), 'w')
            for l in script_lines:
                out.write(l + '\n')
            out.close()

        # Start all jobs
        procs = []
        for i in range(num_nodes):
            frames = np.arange(i + 1, 251, num_nodes)
            lower, upper = frames[0], frames[0]
            procs.append(subprocess.Popen(['sbatch', os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper))]))

    elif method == 'random':
        # Make a new directory for all of the scripts and output
        if not os.path.exists(os.path.join(host, "{}_nodes_{}".format(num_nodes, method))):
            os.makedirs(os.path.join(host, "{}_nodes_{}".format(num_nodes, method)))

        # Generate a random order of frames
        frames = np.arange(1, 251)
        frames = np.random.permutation(frames)        

        for i in range(num_nodes):
            # Assign frames to each node
            # Random: randomly assign 250 / N frames to the i^th of N nodes.
            # Since we performed a permutation on the list [1, ..., 250], we just need to grab some adjacent slice of this list to assign
            # frames to the node, so we use the same synatx as the linear case
            lower = i * max_frames / num_nodes
            upper = (i + 1) * max_frames / num_nodes

            # Add all lines to the script
            script_lines = [l for l in header_lines]
            script_lines.append(exclude_line)
            script_lines.append(out_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.out".format(i, lower, upper))))
            script_lines.append(error_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.err".format(i, lower, upper))))
            
            script_lines.append(job_name.format(lower, upper))

            script_lines.append(hostname_command)
            script_lines.append(time_command)

            # Get all assigned frames and make a blender command for each
            script_frames = frames[lower:upper]
            for frame in script_frames:
                script_lines.append(blender_command.format(file_name, frame, frame))

            script_lines.append(time_command)

            # Write out the script
            out = open(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper)), 'w')
            for l in script_lines:
                out.write(l + '\n')
            out.close()

        # Start all jobs
        procs = []
        for i in range(num_nodes): 
            lower = i * max_frames / num_nodes
            upper = (i + 1) * max_frames / num_nodes
            procs.append(subprocess.Popen(['sbatch', os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper))]))

# Run main only if this script was called directly and not imported
if __name__ == "__main__":
    main()
