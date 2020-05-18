#!/usr/bin/env python

#############################################
# Methods
#############################################
import subprocess

def get_packages():
    '''
    Find the names and locations of all ROS packages

    @rtype: {str, str}
    @return: name and path of ROS packages
    '''
    lines = split_words(run_shellcommand('rospack', 'list'))
    packages = [{'name': name, 'path': path} for name, path in lines]
    return packages

def run_shellcommand(*args):
    '''run the provided command and return its stdout'''
    args = sum([(arg if type(arg) == list else [arg]) for arg in args], [])
    return subprocess.Popen(args,
                            stdout=subprocess.PIPE).communicate()[0].strip()

def split_words(text):
    '''return a list of lines where each line is a list of words'''
    return [line.strip().split() for line in text.split('\n')]

