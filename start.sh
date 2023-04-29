#!/bin/bash

echo "------------------------  STARTING DEPLOYMENT  ------------------------"

# Check if the first argument is a directory
if [ ! -d "$1" ]
then
    echo "😩 $1 is not a directory."
    echo "🛑 Deployment failed."
    exit 1
fi

# Change to working directory
cd $1

# Check if process is running

# Check if the second argument is a process
if [ -z "$2" ]
then
    echo "😩 No process name provided."
    echo "🛑 Deployment failed."
    exit 1
fi
process_name=$2

# Check if binary exists
if [ ! -f "$process_name" ]
then
    echo "😩 $process_name does not exist."
    echo "🛑 Deployment failed."
    exit 1
fi

echo "✅ Arguments are valid."

# Check if process is running
echo "🔍 Looking for $process_name process."
PID=$(pidof $process_name)

echo "🤨 Killing or not killing $process_name."

if [ ! -z "$PID" ] 
then
   echo "✅ $process_name is running as $PID."
   echo "⏳ Killing it."
   kill -9 $PID
   echo "✅ Killed $process_name."
else
   echo "$process_name is not running."
   echo "No killing needed."
fi

echo "🚀 Starting $process_name."

./$process_name > /dev/null 2>&1 &

echo "------------------------  DEPLOYMENT COMPLETED  ------------------------"

exit 0