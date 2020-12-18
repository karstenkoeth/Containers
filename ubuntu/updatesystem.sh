#!/bin/bash

# #########################################
#
# Overview
#
# This script creates a Docker Container with Ubuntu 18.04 prepared for hosting SICK AppEngine Linux x86-64

# #########################################
#
# Versions
#
# 2020-12-17 0.01 kdk First Version

PROG_NAME="Update System - Ubuntu"
PROG_VERSION="0.01"
PROG_SCRIPTNAME="updatesystem"

# #########################################
#
# MIT license (MIT)
#
# Copyright 2020 Karsten Köth
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


# #########################################
#
# Constants
#


# #########################################
#
# Variables
#

actDateTime=$(date "+%Y-%m-%d +%H:%M:%S")

# #########################################
#
# Functions
#

# #########################################
# showHelp()
# Parameter
#    -
# Return Value
#    -
# Show help.
function showHelp()
{
    echo "[$PROG_NAME:STATUS] Program Parameter:"
    echo "    -V     : Show Program Version"
    echo "    -h     : Show this help"
    echo "This script creates a Docker Container with Ubuntu 18.04 prepared for hosting SICK AppEngine Linux x86-64"
}


# #########################################
#
# Main
#

echo "[$PROG_NAME:STATUS] Starting ..."

# Log:
echo "[$PROG_NAME:LOG] $actDateTime " >> ./$PROG_SCRIPTNAME.log

# Check for program parameters:
if [ $# -eq 1 ] ; then
    if   [ "$1" = "-V" ] ; then
        echo "[$PROG_NAME:STATUS] Version $PROG_VERSION" ; exit;
    elif [ "$1" = "-h" ] ; then
        showHelp ; exit;
    fi
fi

# For karstenkoeth/bashutils:
apt-get update -y 
apt-get install -y git
apt-get install -y uuid
apt-get install -y uuid-runtime

# For SICK AppEngine Linux x86-64:
apt-get install -y libice5 libsm6 libfontconfig1
apt-get install -y libgomp1

# FOR SICK AppManager Linux CLI:
apt-get install -y p7zip-full

# Check, if filesystem ist prepared:
mkdir -p -v ~/bin
mkdir -p -v ~/tmp

# Get karstenkoeth/bashutils:
cd ~/tmp
git clone https://github.com/karstenkoeth/bashutils.git
chmod u+x ./bashutils/src/install_bashutils_local.sh
# TODO: Normally, start install script - but it is not done...
# ./bashutils/src/install_bashutils_local.sh

# Get SICK AppEngine with Deep Link:
# Get SICK AppManager with Deep Link: