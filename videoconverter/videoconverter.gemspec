require './lib/videoconverter/version'
Gem::Specification.new do |s|
  s.name        = 'videoconverter'
  s.version     = VideoConverter::VERSION
  s.date        = '2015-01-12'
  s.summary     = 'A gem to process videos'
  s.description = 'Gem to resize, convert format, split, cut, change bit-rate, extract thumnails of videos'
  s.authors     = ['Webonators 2015']
  s.email       = 'divya.sharma@weboniselab.com'
  s.files       = Dir.glob("{bin,lib,config}/**/*")
  s.require_paths =["lib","bin","config"]
  s.add_dependency 'streamio-ffmpeg'
  s.executables << 'videoconverter'
  s.homepage    =
    'http://rubygems.org/gems/videoconverter'
  s.license     = 'Webonise Lab'
end
