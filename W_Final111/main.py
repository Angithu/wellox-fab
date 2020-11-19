import os 
import time 
import threading
import subprocess,sys
from subprocess import PIPE
import shutil
from multiprocessing import Process

command="sudo bash /home/smg/SSDLoader/WELLOX/main.sh" #sudo bash ./main.sh
command2="sudo bash /home/smg/SSDLoader/WELLOX/ffmpeg.sh"

process=subprocess.call(command,shell=True)
print('Success finished open camera')

#process = subprocess.Popen(command, shell=True, stdout=PIPE, stderr=PIPE)
#result=process.communicate()
#x=process.returncode
#print('result',result)
#print('ret',x)

print('process is=',process)
if process == 0:		
	subprocess.call(command2,shell=True)
	if process!=0:
		sys.exit(result)


