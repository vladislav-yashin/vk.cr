class VK::Namespace
  macro method_missing(call)
    @client.request("#{@name}.#{{{call.name.id.stringify}}}", {{call.args}}.first)
  end

  def initialize(@name : String, @client : Client)
  end
end
