import os
from glob import glob
import argparse

def get_time(in_file):
    with open(in_file,'r') as f:
        lines = f.readlines()
        host = lines[0]
        start = int(lines[1])
        end = int(lines[-1])

        return start, end

def get_files(data_dir):
    return glob(os.path.join(data_dir, "*.out"))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("data_dir", help="The directory containing data to be analyzed")

    args = parser.parse_args()

    data_dir = args.data_dir

    files = get_files(data_dir)
    
    starts = [get_time(f)[0] for f in files]
    ends = [get_time(f)[1] for f in files]
 
    exec_time = max(ends) - min(starts)
   
    print("Exec time = {} ns".format(exec_time))
    print("Exec time = {:0.3f} s".format(1e-9 * exec_time))

if __name__ == '__main__':
    main()
