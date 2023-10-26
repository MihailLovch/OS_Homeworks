#!/usr/bin/python3

import os
import random
import sys

def my_fork():
    child = os.fork()
    if child > 0:
        print(f'Parent[{os.getpid()}]: I ran children process with PID {child}.')
    else:
        rand = random.randint(5,10)
        os.execl('./child.py', './child.py', str(rand))
    return child

n = int(sys.argv[1])

def main(n):
    n = int(sys.argv[1])
    for i in range(n):
        child = my_fork()
    while n > 0:
        child_pid, status = os.wait()
        if status != 0:
            child = my_fork()
        else:
            print(f'Parent[{os.getpid()}]: Child with PID {child_pid} terminated. Exit status {status}')
            n = n - 1

main(n)
os._exit(os.EX_OK)