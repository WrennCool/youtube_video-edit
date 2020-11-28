
@echo off

F:
cd F:/youtube/video

set url= ''
set mkvname= ''

setlocal enabledelayedexpansion

set url=%1
echo url=!url!
youtube-dl --proxy socks5://127.0.0.1:10808 --write-sub --write-thumbnail --sub-lang en,zh-CN,zh-TW  -f "webm+m4a" "%url%"
echo --------------------------

for /f "delims=" %%a in ('dir /b *.mkv') do (
set mkvname=%%a
echo videoname="!mkvname!"
md "!mkvname:~0,-16!"

for /f "delims=" %%b in ('dir /b /l /s "!mkvname:~0,-4!".* ') do (copy "%%b" F:\youtube\video\"!mkvname:~0,-16!")

cd "!mkvname:~0,-16!"

python "F:\youtube\split.py" "!mkvname:~0,-4!"
ffmpeg -i "!mkvname!" -strict -2 -vf subtitles="en.vtt":force_style='Fontsize=8\,Fontname=FZYBKSJW--GB1-0\,MarginV=5\,Bold=0\,BorderStyle=1' -qscale:v 3 "en.mp4"
ffmpeg -i "!mkvname!" -strict -2 -vf subtitles="en.vtt":force_style='Fontsize=12\,Fontname=FZYBKSJW--GB1-0\,MarginV=8\,Bold=0\,BorderStyle=1' -qscale:v 3 "Ó¢ÎÄ×ÖÄ»°æ±¾.mp4"
ffmpeg -i "en.mp4" -strict -2 -vf subtitles="zh-CN.vtt":force_style='Fontsize=12\,Fontname=FZYBKSJW--GB1-0\,MarginV=15\,Bold=0\,BorderStyle=1' -qscale:v 3 "ÖÐÓ¢Ë«×Ö°æ±¾.mp4"
ffmpeg -i "en.mp4" -strict -2 -vf subtitles="zh-TW.vtt":force_style='Fontsize=12\,Fontname=FZYBKSJW--GB1-0\,MarginV=15\,Bold=0\,BorderStyle=1' -qscale:v 3 "·±ÖÐÓ¢Ë«×Ö°æ±¾.mp4"
dwebp "!mkvname:~0,-4!".webp -o "!mkvname:~0,-4!".jpg
ffmpeg -i "!mkvname:~0,-4!".jpg -vf scale=900:600 thumbnail.jpg
cd ..

copy "!mkvname:~0,-4!".mkv F:\youtube\video\"!mkvname:~0,-16!"

cd "!mkvname:~0,-16!"
ren "!mkvname!" "¡¾Kurzgesagt¡¿!mkvname:~0,-16!.mkv"
cd ..

del "!mkvname:~0,-4!".*
)
)
