class VK::Collection < VK::BaseObject
  delegate :[], :[]?, empty?, first, first?, join, last, last?, sample, to_a, inspect, to: @data

  def initialize(data : JSON::Any)
    @data = [] of Any
    data.each do |v|
      @data << (Item.new(v) rescue Scalar.new(v))
    end
  end

  def initialize(@data : Array(Any))
  end

  def map(&block : Any -> _)
    VK::Collection.new(@data.map(&block))
  end
end
