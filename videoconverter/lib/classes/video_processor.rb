class VideoProcessor
include FileOperation
  attr_accessor :input_dir, :output_dir, :source_url, :options, :thumbnail,
                :split, :cut_time, :file_path, :file_name, :file_ext,
                :source_file
  def initialize(request)
    @input_dir = "#{request['dir']}/input"
    @output_dir = "#{request['dir']}/output"
    @source_url = request['source_url']
    @options = request['actions']
    @thumbnail = @options['thumbnail']
    @split = @options['split']
    @cut_time = @options['cut'].split('-')
  end

  def process_video
    response_object = Response.instance
    pre_processing
    movie = FFMPEG::Movie.new(@file_path)
    screenshot(movie) if @thumbnail
    custom_cut_command if @cut_time
    movie_object = movie.transcode("#{@output_dir}/#{@file_name}#{@file_ext}",
                                   @options){ |progress| progress_status(progress) }
    @split_time = (movie_object.duration / @split).to_i if @split
    split_movie(movie_object) if @split
    response_object.finish(200, ["{destination_url: 'voodoo.com/#{@output_dir}'}"])
  end

  def pre_processing
    uri = URI.parse(@source_url)
    @source_file = File.basename(uri.path)
    set_values
    create_directory
    download_file
  end

  def set_values
    @file_path = "#{@input_dir}/#{@source_file}"
    @file_name = base_name(@source_file)
    @options.class
    @file_ext = @options.key?('ext') ? @options['ext'] : file_extension(@source_file)
  end

  def create_directory
    make_directory(@input_dir)
    make_directory(@output_dir)
  end

  def download_file
    %x{ wget -P '#{@input_dir}' '#{@source_url}' }
  end

  def screenshot(movie) # ,options)
    movie.screenshot("#{@output_dir}/#{@file_name}.jpg",
                     seek_time: @thumbnail,
                     resolution: '180x120')
  end

  def custom_cut_command
    @options.merge!(custom: "-ss #{@cut_time[0]} -to #{@cut_time[1]}")
  end

  def split_movie(movie_object)
    options = { custom: "-acodec copy -vcodec copy -f segment -segment_time #{@split_time} -reset_timestamps 1 -map 0" }
    movie_object.transcode("#{@output_dir}/#{@file_name}%2d#{@file_ext}",
                           options)
  end

  def progress_status(progress)
    progress *= 100
    puts "******************* #{progress.to_i} % Completed *********************"
  end
end