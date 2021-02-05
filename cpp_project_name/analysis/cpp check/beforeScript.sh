#!/bin/bash

set -e

apt update
apt -y install cppcheck
apt -y install python-pygments