#!/bin/bash
DISPLAY=:99.0
export DISPLAY
/etc/init.d/xvfb start
/etc/init.d/xvfb status
cucumber -f pretty -f html -o reports/index.html $@
