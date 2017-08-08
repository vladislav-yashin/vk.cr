require "./src/vk"

vk = VK::Client.new

users = vk.users.get({ user_ids: [1, 23113656] }).response
p vk.users.get({ user_ids: users.map &.uid })
