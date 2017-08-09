require "http/client"
require "json"

class VK::Client
  macro method_missing(call)
    Namespace.new({{call.name.id.stringify}}, self)
  end

  def initialize(@access_token : String | Nil = nil, @api_version = "5.67")
  end

  def configure(&block : Client)
  end

  def request(method_name, params = {} of String => RequestParam)
    headers = HTTP::Headers{ "Content-Type" => "application/x-www-form-urlencoded" }
    response = HTTP::Client.post("https://api.vk.com/method/#{method_name}", headers, build_request_body(params))
    Item.new(JSON.parse(response.body))
  end

  private def build_request_body(params)
    params_array = params.to_h.each_with_object([] of String) do |params_pair, memo|
      memo << "#{params_pair.first}=#{prepare_request_param(params_pair.last)}"
    end
    params_array.join("&")
  end

  private def prepare_request_param(param)
    param.is_a?(RequestParamsArray) ? param.join(",") : param
  end
end
