class VK::Namespace
  macro method_missing(call)
    method_name = {{call.name.id.stringify}}
    @client.request("#{@name}.#{method_name[0].downcase}#{method_name.camelcase.lchop}", {{call.args}}.first)
  end

  def initialize(@name : String, @client : Client)
  end
end
