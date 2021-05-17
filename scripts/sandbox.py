import tempfile 
import os 
import shutil

def get_next_folder(test_path: str, max_files: int):
    i = 0
    files = list(filter(lambda x: os.path.isfile(x), os.listdir(test_path)))

    for i in range(0, len(files), max_files):
        batched_files = files[i:min(i+max_files, len(files))]
        tmp_dir = tempfile.TemporaryDirectory()
        for f in batched_files:
            shutil.copy(os.path.join(test_path, f), tmp_dir.name)
        yield tmp_dir

for f in get_next_folder(".", 2):
    for g in os.listdir(f.name):
        print(g)
