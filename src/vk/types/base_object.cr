abstract class VK::BaseObject
  macro method_missing(call)
    raise "Can not access property or method with such name"
  end
end
