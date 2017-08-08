class VK::Scalar < VK::BaseObject
  delegate as_s, as_i, as_bool, as_f, to_s, inspect, :==, to: @value

  def initialize(@value : JSON::Any)
  end
end
