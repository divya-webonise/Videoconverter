# Response to the request
class Response
  include Singleton

  RESPONSE = YAML.load_file(::File.expand_path('../../../config/response.yml', __FILE__))
  RESPONSE[:status].default 'Unexpected Error'

  def finish(code, body = {})
    ['status' => RESPONSE[:status][code],
          'ContentType' => RESPONSE[:content_type], 'body' => body]
  end
end
