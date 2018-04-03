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

    test_dirs = glob(os.path.join(data_dir, "*"))
    test_dirs = [d for d in test_dirs if os.path.isdir(d)]

    data = {}
    for test_dir in test_dirs:

        files = get_files(test_dir)
        
        starts = [get_time(f)[0] for f in files]
        ends = [get_time(f)[1] for f in files]
     
        exec_time = max(ends) - min(starts)
       
        #print("Test Type: {}".format(os.path.basename(test_dir)))
        #print("Exec time = {} ns".format(exec_time))
        #print("Exec time = {:0.3f} s".format(1e-9 * exec_time))

        data[os.path.basename(test_dir)] = 1e-9 * exec_time

    for key in data.keys():
        print("{} {}".format(key, data[key]))

if __name__ == '__main__':
    main()
