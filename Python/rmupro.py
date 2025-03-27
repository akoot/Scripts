import sys
import os
import datetime
import pathlib
import shutil
import subprocess
import random

# Open a random FL or Ableton project from this directory

fl_path = "C:\\Program Files\\Image-Line\\FL Studio 2024\\FL64.exe"
ableton_path = "C:\\ProgramData\\Ableton\\Live 12 Suite\\Program\\Ableton Live 12 Suite.exe"

cwd = os.getcwd()
file_paths = []

# Get a list of valid files
for root, dirs, files in os.walk(cwd):
	for name in files:
		file_path = os.path.join(root, name)
		if os.path.splitext(file_path)[1] in ['.als', '.flp']:
			 file_paths += [file_path]

random_project = random.choice(file_paths)
choice = input(f'Open "{random_project}"? (Y\\N) ')
while choice in ['n', 'N']:
	random_project = random.choice(file_paths)
	choice = input(f'Open "{random_project}"? (Y\\N) ')

print(f'Opening "{random_project}"!')
if os.path.splitext(random_project)[1] == '.als':
	subprocess.call([ableton_path, random_project])
else:
	subprocess.call([fl_path, random_project])

quit()