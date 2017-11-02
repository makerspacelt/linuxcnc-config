#!/usr/bin/python

import sys
import os
import subprocess
import importlib
from machinekit import launcher
from time import *


launcher.register_exit_handler()
launcher.set_debug_level(5)
os.chdir(os.path.dirname(os.path.realpath(__file__)))

try:
    launcher.check_installation()  # make sure the Machinekit installation is sane
    launcher.cleanup_session()  # cleanup a previous session

    launcher.start_process("configserver ~/Cetus/")  # start the configserver with Machineface an Cetus user interfaces
    launcher.start_process('machinekit cnc.ini')  # start linuxcnc
except subprocess.CalledProcessError:
    launcher.end_session()
    sys.exit(1)

# loop until script receives exit signal
# or one of the started applications exited incorrectly
# cleanup is done automatically
while True:
    sleep(1)
    launcher.check_processes()


