# FileOperation Module is for all file related operations
module FileOperation
    def make_directory(directory)
      FileUtils.mkdir_p "#{directory}"
    end

    def current_path
      File.expand_path('../', File.dirname(__FILE__))
    end

    def base_name(file)
      File.basename(
        file,
        File.extname(file))
    end

    def file_extension(file)
      File.extname(file)
    end
end
