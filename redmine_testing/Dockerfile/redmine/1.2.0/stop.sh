#!/bin/bash
PID=`pidof /usr/local/bin/ruby`
kill -9 ${PID}
