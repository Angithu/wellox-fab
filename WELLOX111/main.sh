#!/bin/sh
mjpg_streamer -i "input_uvc.so -y -n -d /dev/video0 -f 30 -r 640x480 " -o "output_http.so -w ./www -p 8001" &
sleep 1
mjpg_streamer -i "input_uvc.so -y -n -d /dev/video2 -f 30 -r 640x480 " -o "output_http.so -w ./www -p 8002" &
sleep 1
mjpg_streamer -i "input_uvc.so -y -n -d /dev/video4 -f 30 -r 640x480 " -o "output_http.so -w ./www -p 8003" &
sleep 1
mjpg_streamer -i "input_uvc.so -y -n -d /dev/video6 -f 30 -r 640x480 " -o "output_http.so -w ./www -p 8004" &
sleep 1 
mjpg_streamer -i "input_uvc.so -y -n -d /dev/video8 -f 30 -r 640x480 " -o "output_http.so -w ./www -p 8005" &
sleep 1
mjpg_streamer -i "input_uvc.so -y -n -d /dev/video10 -f 30 -r 640x480 " -o "output_http.so -w ./www -p 8006" &
sleep 1 


