# youtube_video-edit

## 项目说明
这是一个用来自动下载**youtube**视频的脚本，主要编辑语言为bash，其中也包含了一点点**python**
### 功能介绍


## 所需的库
- python 环境，并建议同时配置好pip包，因为下述的支持库依赖python环境

- [youtube-dl](https://github.com/ytdl-org/youtube-dl/)

```python
pip install youtube-dl
```

- [ffmpeg](https://ffmpeg.org/) 一个图像编辑程序

## 使用方法

### 配置依赖库
如上所示

### 更改下载路径
使用时需要将文件放置入F盘（如果你有的话），或者进入代码界面更改相应的路径为你下载的路径。
改动方法如下：
- 首先明确你的下载位置，如 `D:\`
- 修改 one.bat 以及 split.py 内的路径
- 将one.bat 所在的路径加入系统环境变量

### 下载方法
1. 复制你想要下载的youtube视频地址
2. 打开命令行，输入`one "[url]"`，注意地址需要用引号括起来
