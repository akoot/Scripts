import sys
import os
import datetime
import pathlib
import shutil
import subprocess
import sys, getopt

# Create a new music project from a template
# If you want to make a project with both FL and/or Ableton files

root = os.getcwd()
date = datetime.datetime.now()

def capitalize(title):
	if len(title) > 1:
		allcaps = True
		for x in title:
			if not x.isupper():
				allcaps = False
				break
		if not allcaps:
			y = ""
			for x in title.split(" "):
				y = y + x[0].upper() + x[1:] + " "
			return y.strip()
		else:
			return title
	else:
		return title.upper()

def mkdirp(path):
	pathlib.Path(path).mkdir(parents=True, exist_ok=True)

def copytree(src, dst, symlinks=False, ignore=None):
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)

# def generate(daw, title, album):
# 	print(f"DAW='{daw}' Title='{title}' Album='{album}'")

def generate(daw, title, album):
	folder = "Archive/" + str(date.year)

	extension = "flp" if daw == "FL" else "als"

	if album != '':
		folder = 'Albums/' + album
	elif 'remix' in title.lower():
		folder = "Remixes"

	folder += '/' + title
	mkdirp(folder)

	cwd = os.getcwd()
	folder = cwd + '/' + folder

	copytree(f"{root}/Defaults/{daw} Project", folder)

	if daw == "Multi":
		shutil.move(f"{folder}/Default.flp", f"{folder}/{title}.flp")
		shutil.move(f"{folder}/Default.als", f"{folder}/{title}.als")
	else:
		shutil.move(f"{folder}/Default.{extension}", f"{folder}/{title}.{extension}")

	os.chdir(folder)

	subprocess.call(["attrib", "+s", folder])
	subprocess.call(["attrib", "+h", "Desktop.ini"])
	subprocess.call(["git", "config", "--global", "--add", "safe.directory", os.getcwd().replace('\\','/')])
	subprocess.call(["git", "init"])
	subprocess.call(["git", 'add', '-A'])
	subprocess.call(["git", "commit", '-m', 'Start'])

def main(argv):

	daw = ''
	title = ''
	album = ''

	if len(argv) == 0:
		daw = input("DAW: ")
		title = input('title: ')
		album = input('Album: ')
	else:
		usage = 'New Project.py -d <daw> -t <title> [-a <album>]'
		try:
			opts, args = getopt.getopt(argv,"hd:t:a:C",["daw=","title=","album="])
		except getopt.GetoptError:
			print(usage)
			sys.exit(2)
		for opt, arg in opts:
			if opt == '-h':
				print(usage)
				sys.exit()
			elif opt in ("-d", "--daw"):
				daw = arg
			elif opt in ("-t", "--title"):
				title = arg
			elif opt in ("-a", "--album"):
				album = arg
			elif opt in ("-C", "--capitalize"):
				title = capitalize(title)
				album = capitalize(album)
	if daw == '' or title == '':
		print('Specify at least DAW and title!')

	if daw.lower() == "fl":
		daw = "FL"
	elif daw.lower() == "ableton":
		daw = "Ableton"
	elif daw.lower() in ["multi", "both", "any", "mixed", "mix", "flableton"]:
		daw = "Multi"
	else:
		print("Invalid DAW!")
		sys.exit(2)

	generate(daw, title, album)

if __name__ == "__main__":
   main(sys.argv[1:])