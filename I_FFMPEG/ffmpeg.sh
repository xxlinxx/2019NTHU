omxplayer -o both --loop $(youtube-dl -g --skip-download -f best "https://youtu.be/yViwjPeI2K4")

omxplayer -o both --loop $(youtube-dl -f 249 -g "https://youtu.be/kFdFz6rQkR0")
omxplayer -o both --loop $(youtube-dl -f 249 -g "https://www.youtube.com/watch?v=ZSLwGE2q4Eo")

omxplayer https://www.youtube.com/watch?v=VNW3aMAHws8 --live --fps 30

omxplayer -o both -s http://wowza4.nexttv.com.tw/liveedge/eratv3/chunklist.m3u8

mpv $(youtube-dl -g --skip-download -f best "https://youtu.be/yViwjPeI2K4")
mpv $(youtube-dl -g --skip-download -f best "https://youtu.be/kFdFz6rQkR0")

youtube-dl --list-formats "https://youtu.be/yViwjPeI2K4"
youtube-dl --list-formats "https://youtu.be/kFdFz6rQkR0"


livestreamer -O https://youtu.be/yViwjPeI2K4

www.youtube.com/get_video_info?&video_id=yViwjPeI2K4
www.youtube.com/get_video_info?&video_id=kFdFz6rQkR0
livestreamer https://www.youtube.com/watch?v=su2pg029awQ

youtube-dl -f 95 -g 
140          m4a        audio only DASH audio  144k , m4a_dash container, mp4a.40.2@128k
160          mp4        256x144    144p  124k , avc1.4d400c, 30fps, video only
133          mp4        426x240    240p  258k , avc1.4d4015, 30fps, video only
134          mp4        640x360    360p  646k , avc1.4d401e, 30fps, video only
135          mp4        854x480    480p 1171k , avc1.4d401f, 30fps, video only
136          mp4        1280x720   720p 2326k , avc1.4d401f, 30fps, video only (best)

youtube-dl -f 136 -g https://youtu.be/yViwjPeI2K4

omxplayer -o both https://r6---sn-ipoxu-un5s.googlevideo.com/videoplayback?keepalive=yes&cmbypass=yes&source=yt_live_broadcast&sparams=aitags%2Ccmbypass%2Cei%2Cgcr%2Cgir%2Chang%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Ckeepalive%2Clive%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnoclen%2Cpcm2cms%2Cpl%2Crequiressl%2Csource%2Cexpire&initcwndbps=973750&beids=%5B9466594%5D&pl=22&ei=3fReWvvMEsS64gKU4bPACQ&gcr=tw&pcm2cms=yes&noclen=1&ip=59.115.102.22&live=1&id=yViwjPeI2K4.0&aitags=133%2C134%2C135%2C136%2C160&gir=yes&itag=136&signature=D7376969157B6BA63C57D996F5CA154C935F671F.6DCBDDA2C589E8607AE82FCEC625182813940D5D&mm=32&mn=sn-ipoxu-un5s&key=yt6&ms=lv&mt=1516172411&mv=m&expire=1516194109&hang=1&requiressl=yes&ipbits=0&mime=video%2Fmp4&ratebypass=yes

https://manifest.googlevideo.com/api/manifest/dash/hfr/all/ei/pfheWr2ZDsHyqAGvoJrYCg/gcr/tw/itag/0/signature/39E8332025A7E970BB1E2D45884C1AAEAB96FF28.7D39E5A252C04A139B57E969630F183AF657F70B/requiressl/yes/ip/59.115.102.22/key/yt6/playlist_type/DVR/ipbits/0/as/fmp4_audio_clear%2Cwebm_audio_clear%2Cwebm2_audio_clear%2Cfmp4_sd_hd_clear%2Cwebm2_sd_hd_clear/source/yt_live_broadcast/sparams/as%2Cei%2Cgcr%2Chfr%2Cid%2Cip%2Cipbits%2Citag%2Cplaylist_type%2Crequiressl%2Csource%2Cexpire/expire/1516195078/id/yViwjPeI2K4.0?cpn=h3YDeQsOK63XbibX&mpd_version=5&start_seq=15597

https://www.youtube.com/embed/live_stream?channel=



livestreamer https://youtu.be/yViwjPeI2K4 mobile_480p --player omxplayer --fifo

omxplayer https://youtu.be/yViwjPeI2K4 --live --fps 30

#!/bin/bash
while true
do
    livestreamer http://ustream.tv/channel/iss-hdev-payload best --player omxplayer --fifo --player-args "--win \" 1280 0 1280 720\" {filename}"

done

omxplayer -o both --loop $(youtube-dl -f 249 -g "https://r6---sn-ipoxu-un5z.googlevideo.com/videoplayback?id=yViwjPeI2K4.0&itag=136&source=yt_live_broadcast&requiressl=yes&playlist_type=DVR&ei=g_BeWrGAJZD04wLtwJaIBA&gcr=tw&ratebypass=yes&cmbypass=yes&mime=video%2Fmp4&live=1&gir=yes&noclen=1&dur=2.000&cpn=s7w0ruccAnsEj9EP&mpd_version=5&ip=59.115.102.22&ipbits=0&expire=1516192996&sparams=cmbypass,dur,ei,expire,gcr,gir,id,ip,ipbits,itag,live,mime,mm,mn,ms,mv,noclen,pl,playlist_type,ratebypass,requiressl,source&signature=3E2514B7C39597C2AF1C46D0920BAA08A9AEA6BF.74F1FA927CCFD0389DF373807B9363E17FB56007&key=cms1&mm=32&mn=sn-ipoxu-un5z&ms=lv&mt=1516171332&mv=m&pl=22&alr=yes&c=WEB&cver=2.20180116&sq=13741&rn=164&rbuf=9328")


ffmpeg -re -i <https://M3U8 STREAM HERE> -c:v copy -c:a aac -ar 44100 -ab 128k -ac 2 -strict -2 -flags +global_header -bsf:a aac_adtstoasc -bufsize 3000k -f flv rtmp://a.rtmp.youtube.com/live2/<youtube-stream-key>

