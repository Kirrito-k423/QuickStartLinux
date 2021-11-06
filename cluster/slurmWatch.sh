#!/bin/python3
import re
import sys
import os
from subprocess import Popen, PIPE
from shlex import split

def monitor_task(task):
    p1 = Popen(split(f"sacct -j {task} --format=JobID,User,JobName,Partition,QOS,Elapsed,Start,NodeList,State,ExitCode"), stdout=PIPE)

    # List out output files
    p2 = Popen(split("sed -n 3p"), stdin=p1.stdout, stdout=PIPE)
    #outputfiles = p2.stdout.readlines()

    out, err = p2.communicate()
    out = split(out.decode('utf-8')[:-1])

    task_id = out[0]
    user_id = out[1]
    task_name = out[2]
    time_cost = out[5]
    task_status = out[-2]

    if (task_status == "COMPLETED"):
        return (task_id, user_id, task_name, time_cost)
    else:
        return None


index = 17000

tag = {}

while index < 20100:
    ans = (monitor_task(index))
    if ans is not None:
        time = ans[3]
        time = int(time[-2:])
        if (time <= 5):
            print(ans)
            team_id = ans[1]
            if not team_id in tag:
                tag[team_id] = time
    index = index + 1