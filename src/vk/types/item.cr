class VK::Item < VK::BaseObject
  delegate :[], each, inspect, to: @properties

  macro method_missing(call)
    @properties[{{call.name.id.stringify}}]
  end

  def initialize(properties : JSON::Any)
    @properties = {} of String => VK::Any
    properties.each do |k, v|
      if v.as_a?
        @properties[k.as_s] = Collection.new(v)
      elsif v.as_h?
        @properties[k.as_s] = VK::Item.new(v)
      else
        @properties[k.as_s] = Scalar.new(v)
      end
    end
  end
end
