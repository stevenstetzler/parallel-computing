import subprocess

def main():
    header_lines = ['#!/bin/bash', '#SBATCH --job-name="CS 4444"']
    out_file = '#SBATCH --output=script-output-{0}'

    script_file = 'slurm_{0}.sh'

    file_name = 'Star-collapse-ntsc.blend'

    time_command = 'date +%s'

    blender_command = 'time blender -b {0} -s {1} -e {2} -a'
#    blender_command = 'echo "{0} {1} {2}"'

    max_frames = 10
    num_scripts = 4

    for i in range(num_scripts):
        script_lines = [l for l in header_lines]
        script_lines.append(out_file.format(i))
        
        lower = i * max_frames / num_scripts + 1
        upper = (i + 1) * max_frames / num_scripts

        script_lines.append(time_command)
        script_lines.append(blender_command.format(file_name, lower, upper))
        script_lines.append(time_command)

        out = open(script_file.format(i), 'w')
        for l in script_lines:
            print(l)
            out.write(l + '\n')
        out.close()

    procs = []
    for i in range(num_scripts):
        procs.append(subprocess.Popen(['sbatch', script_file.format(i)]))

    while True:
        print([p.poll() != None for p in procs])
        if all([p.poll() != None for p in procs]):
            break

if __name__ == "__main__":
    main()
