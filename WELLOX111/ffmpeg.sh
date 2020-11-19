#!/bin/sh

# record video
#ffmpeg -f mjpeg -r 30 -i "http://127.0.0.1:8888/?action=stream" -r 30 ./video.avi

# high quality
#ffmpeg -y -f mjpeg -r 30 -i "http://127.0.0.1:8888/?action=stream" -q:v 5 -an ./video.avi

# split video
Min="$(date +'%M')" 
Sec="$(date +'%S')" 
echo "Now_Min" $Min
echo "Now_Sec" $Sec
OMin=$((59-Min))
OSec=$((59-Sec)) 
echo "Original_Record_Min" $OMin
echo "Original_Record_Sec" $OSec
Min=$(((59-Min)*11667/10000))
Sec=$(((59-Sec)*11667/10000))
ms=000
echo "rate_min" $Min
echo "rate_sec" $Sec
Time=00:$Min:$Sec
echo $Time
now="$(date +'%Y%m%d')"_"$(date +'%H%M')"_"$(date +'%S')" 
echo $now
{
#ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8001/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 450k -bufsize:v 500k -an ./video1_$now.mp4
ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8001/?action=stream" -q:v 5 -filter:v "setpts =0.858*PTS"  -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video1_$now.mp4
echo "test"
}&
{
#ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8001/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 450k -bufsize:v 500k -an ./video1_$now.mp4
ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8002/?action=stream" -q:v 5 -filter:v "setpts =0.858*PTS"  -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video2_$now.mp4
}&
{
#ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8003/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 300k -bufsize:v 350k -an ./video3_$now.mp4
ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8003/?action=stream" -q:v 5 -filter:v "setpts =0.858*PTS"  -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video3_$now.mp4
}& 
{
#ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8004/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 300k -bufsize:v 350k -an ./video4_$now.mp4
ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8004/?action=stream" -q:v 5 -filter:v "setpts =0.858*PTS"  -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video4_$now.mp4
}& 
{
#ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8005/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 300k -bufsize:v 350k -an ./video5_$now.mp4
ffmpeg -y -ss 00:00:00 -t $Time -f mjpeg -i "http://127.0.0.1:8005/?action=stream" -q:v 5 -filter:v "setpts =0.858*PTS"  -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video5_$now.mp4
}&wait
INDEX=0
Flag=1
while : #[ $INDEX -le $Flag]
n="$(date +'%Y%m%d')"_"$(date +'%H%M')"_"$(date +'%S')" 
do
{
sudo find /home/smg/SSDLoader/WELLOX/  -name "*.mp4" -mtime +1 -exec rm {} \;
echo "************Finish purge over 3days Video************"
}&
{
#ffmpeg -y -ss 00:00:00 -t 00:59:59.55 -f mjpeg -i "http://127.0.0.1:8001/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 600k -bufsize:v 600k -an  ./video1_$n.mp4
ffmpeg -y -ss 00:00:00 -t 01:09:55.000 -f mjpeg -i "http://127.0.0.1:8001/?action=stream" -q:v 5 -filter:v "setpts =0.858*PTS"  -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video1_$n.mp4
}& 
{
#ffmpeg -y -ss 00:00:00 -t 00:59:59.55 -f mjpeg -i "http://127.0.0.1:8001/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 600k -bufsize:v 600k -an  ./video1_$n.mp4
ffmpeg -y -ss 00:00:00 -t 01:09:55.000 -f mjpeg -i "http://127.0.0.1:8002/?action=stream" -q:v 5 -filter:v "setpts =0.858*PTS"  -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video2_$n.mp4
}& 
{
#ffmpeg -y -ss 00:00:00 -t 00:59:59.55 -f mjpeg -i "http://127.0.0.1:8003/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 600k -bufsize:v 600k -an ./video3_$n.mp4
ffmpeg -y -ss 00:00:00 -t 01:09:55.000 -f mjpeg -i "http://127.0.0.1:8003/?action=stream" -q:v 5  -filter:v "setpts =0.858*PTS" -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video3_$n.mp4
}& 
{
#ffmpeg -y -ss 00:00:00 -t 00:59:59.55 -f mjpeg -i "http://127.0.0.1:8004/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 600k -bufsize:v 600k -an ./video4_$n.mp4
ffmpeg -y -ss 00:00:00 -t 01:09:55.000 -f mjpeg -i "http://127.0.0.1:8004/?action=stream" -q:v 5  -filter:v "setpts =0.858*PTS" -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video4_$n.mp4
}& 
{
#ffmpeg -y -ss 00:00:00 -t 00:59:59.55 -f mjpeg -i "http://127.0.0.1:8005/?action=stream" -q:v 5 -filter:v "setpts =0.85*PTS" -maxrate:v 600k -bufsize:v 600k -an -an ./video5_$n.mp4
ffmpeg -y -ss 00:00:00 -t 01:09:55.000 -f mjpeg -i "http://127.0.0.1:8005/?action=stream" -q:v 5  -filter:v "setpts =0.858*PTS" -maxrate:v 400k -bufsize:v 600k -an  /home/smg/SSDLoader/WELLOX/video5_$n.mp4
}&wait
done



