#!/bin/bash
DISPLAY=:99.0
export DISPLAY 
/etc/init.d/xvfb start
cucumber
