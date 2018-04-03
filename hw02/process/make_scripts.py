import subprocess
import os
import argparse
import numpy as np

def main():
    
    parser = argparse.ArgumentParser()
    parser.add_argument("host", type=str, help="The host to run on")
    parser.add_argument("num_nodes", type=int, help="The number of nodes to run on")
    parser.add_argument("--method", required=False, default="linear", help="The method to use for load balancing. Default=linear")
    args = parser.parse_args()

    num_nodes = args.num_nodes
    host = args.host
    method = args.method

    file_name = "Star-collapse-ntsc.blend"
    
    header_lines = ['#!/bin/bash']
    
    out_file = '#SBATCH --output={}'

    error_file = '#SBATCH --error={}'

    job_name = '#SBATCH --job-name="{0}-{1}"'
    

    hosts = ['hermes[1-4]', 'trillian[1-3]', 'artemis[1-7]', 'qdata[1-8]', 'granger[1-8]', 'nibbler[1-4]', 'slurm[1-5]']

    exclude_list = [e for e in hosts if host not in e]
    
    exclude_line = "#SBATCH --exclude={0}".format(",".join(exclude_list))
    
    script_file = 'slurm_{0}_{1}_{2}.sh'

    time_command = 'date +%s%N'

    hostname_command = 'hostname'

    blender_command = 'time blender -t 1 -b {0} -s {1} -e {2} -a &> /dev/null'
    #blender_command = 'time blender -t 1 -b {0} -s {1} -e {2} -a'

    max_frames = 250

    if method == 'linear':
        if not os.path.exists(os.path.join(host, "{}_nodes".format(num_nodes))):
            os.makedirs(os.path.join(host, "{}_nodes".format(num_nodes)))

        for i in range(num_nodes): 
            lower = i * max_frames / num_nodes + 1
            upper = (i + 1) * max_frames / num_nodes
           
            script_lines = [l for l in header_lines]
            script_lines.append(exclude_line)
            script_lines.append(out_file.format(os.path.join(host, "{}_nodes".format(num_nodes), "script_{}_{}_{}.out".format(i, lower, upper))))
            script_lines.append(error_file.format(os.path.join(host, "{}_nodes".format(num_nodes), "script_{}_{}_{}.err".format(i, lower, upper))))
            
            script_lines.append(job_name.format(lower, upper))

            script_lines.append(hostname_command)
            script_lines.append(time_command)
            script_lines.append(blender_command.format(file_name, lower, upper))
            script_lines.append(time_command)

            out = open(os.path.join(host, "{}_nodes".format(num_nodes), script_file.format(i, lower, upper)), 'w')
            for l in script_lines:
                out.write(l + '\n')
            out.close()


        procs = []
        for i in range(num_nodes):
            lower = i * max_frames / num_nodes + 1
            upper = (i + 1) * max_frames / num_nodes
            #print(" ".join(['sbatch', script_file.format(i, lower, upper)]))
            procs.append(subprocess.Popen(['sbatch', os.path.join(host, "{}_nodes".format(num_nodes), script_file.format(i, lower, upper))]))
    
    elif method == 'interleave':
        if not os.path.exists(os.path.join(host, "{}_nodes_{}".format(num_nodes, method))):
            os.makedirs(os.path.join(host, "{}_nodes_{}".format(num_nodes, method)))

        for i in range(num_nodes): 
            frames = np.arange(i + 1, 251, num_nodes)
            lower, upper = frames[0], frames[0]

            script_lines = [l for l in header_lines]
            script_lines.append(exclude_line)
            script_lines.append(out_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.out".format(i, lower, upper))))
            script_lines.append(error_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.err".format(i, lower, upper))))
            
            script_lines.append(job_name.format(lower, upper))

            script_lines.append(hostname_command)
            script_lines.append(time_command)

            for frame in frames:
                script_lines.append(blender_command.format(file_name, frame, frame))

            script_lines.append(time_command)

            out = open(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper)), 'w')
            for l in script_lines:
                out.write(l + '\n')
            out.close()


        procs = []
        for i in range(num_nodes):
            frames = np.arange(i + 1, 251, num_nodes)
            lower, upper = frames[0], frames[0]
            #print(" ".join(['sbatch', script_file.format(i, lower, upper)]))
            procs.append(subprocess.Popen(['sbatch', os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper))]))

    elif method == 'random':
        if not os.path.exists(os.path.join(host, "{}_nodes_{}".format(num_nodes, method))):
            os.makedirs(os.path.join(host, "{}_nodes_{}".format(num_nodes, method)))

        frames = np.arange(1, 251)
        frames = np.random.permutation(frames)        

        for i in range(num_nodes): 
            lower = i * max_frames / num_nodes
            upper = (i + 1) * max_frames / num_nodes

            script_lines = [l for l in header_lines]
            script_lines.append(exclude_line)
            script_lines.append(out_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.out".format(i, lower, upper))))
            script_lines.append(error_file.format(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), "script_{}_{}_{}.err".format(i, lower, upper))))
            

            script_lines.append(job_name.format(lower, upper))

            script_lines.append(hostname_command)
            script_lines.append(time_command)

            script_frames = frames[lower:upper]
            for frame in script_frames:
                script_lines.append(blender_command.format(file_name, frame, frame))

            script_lines.append(time_command)

            out = open(os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper)), 'w')
            for l in script_lines:
                out.write(l + '\n')
            out.close()

        procs = []
        for i in range(num_nodes): 
            lower = i * max_frames / num_nodes + 1
            upper = (i + 1) * max_frames / num_nodes
            #print(" ".join(['sbatch', script_file.format(i, lower, upper)]))
            procs.append(subprocess.Popen(['sbatch', os.path.join(host, "{}_nodes_{}".format(num_nodes, method), script_file.format(i, lower, upper))]))


if __name__ == "__main__":
    main()
