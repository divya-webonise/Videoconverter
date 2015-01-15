require ::File.expand_path('../../config/bootstrap', __FILE__)
# This class is responsible for processing video
class VideoConverter
  def self.process(request)
    video_processor = VideoProcessor.new(request)
    video_processor.process_video
  end
end
