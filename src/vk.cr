require "./vk/*"
require "./vk/types/*"

module VK
  alias Any = Item | Scalar | Collection
  alias RequestParamsArray = Array(Int32) | Array(Bool) | Array(String) | Array(Any) | Collection
  alias RequestParam = Int32 | Bool | String | RequestParamsArray | Any
end
