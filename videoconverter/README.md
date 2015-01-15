Videoconverter
==============

Videoconverter gem is used for video processing .It make use of the ffmpeg command and streamio-ffmpeg wrapper for reading metadata and transcoding videos.It is used for providing basic functionalities related to video such as bitrate,resolution,thumbnail,split,cut,format conversion etc. 

Compatibility
-------------
Ruby:
Tested with ruby 2.0.0

ffmpeg:
Tested with ffmpeg-2.5.3

streamio-ffmpeg:
The current gem is tested against streamio-ffmpeg 1.0.0.

Dependencies 
------------

[FFmpeg](https://www.ffmpeg.org)::
FFmpeg is a complete solution to record, convert and stream audio and video. It is a command line tool to convert one video file format to another. It supports various formats.
e.g. If you want to convert an avi file into mpg format:
ffmpeg -i input.avi output.mpg 

[streamio-ffmpeg Gem]:
streamio-ffmpeg is a wrapper that make use of ffmpeg commands. The functionalities provided through streamio-ffmpeg are such as duration ,size, frame rate etc of video file .

Installation
------------
ffmpeg installation is given in install.sh file
```Shell
(sudo) gem install videoconverter
```
supported formats
-----------------

|Extension |
|----------|
|.avi      | 
|.mp4      |  
|.wav      | 
|.mov      |  
|.m4a      | 
|.mkv      | 
|.ogg      |


Usage
-----

### Require the gem

``` ruby
require 'videoconverter'
```
* Example
``` ruby
request = {"source_url": "http://download.wavetlan.com/SVV/Media/HTTP/MP4/ConvertedFiles/Media-Convert/Unsupported/test7.mp4",
  "actions": 
  {
    "resolution"    : "320x240",
    "video_bitrate" : 92,
    "thumbnail"     : 20,
    "split"         : 3,
    "cut"           : "00:00:10-00:01:10",
    "ext"           : ".avi"
  },
  "directory": "/home/webonise/jobs/"}
VideoConverter.process(request)
```
####resolution(width,height)
Resize the video according to resolution

* Example

``` ruby
"actions": {"resolution": "320x240"}
```

#### split(no.of parts)
Splitting videos in equal parts

* Example

``` ruby
"actions": {"split": 3 }
```

#### thumbnail(time)
Thumbnail provides an image according to time

* Example

``` ruby
"actions": {"thumbnail": 10}
```

#### bitrate(no.of kilobits per second)
Bitrate of video gives number of kilobits per second

* Example

``` ruby
"actions": {"video_bitrate": 92}
```
#### cut(start_time,end_time)
Cuts the video from given start time to given end time

* Example

``` ruby
"actions": {"cut": "00:00:10-00:01:10"}
```
####ext(extension)
Extension provides a given extension to the video

* Example

``` ruby
 "actions": {"ext": ".avi"}
```