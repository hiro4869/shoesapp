# i = 1

# while i < 6 do

#   Product.seed do |s|
#     s.id = i
#     s.price = i * 1000
#     s.p_name = "#{i}太郎の靴"
#     s.description = "#{i}太郎の靴です"
#     s.user_id = i
#     s.image = nil
#     s.category_id = rand(1..4)
#   end

#   i += 1
# end


Product.seed do |s|
  s.id = 1
  s.price = 1000
  s.p_name = "リーガルの靴"
  s.description = "リーガルの靴"
  s.user_id = 1
  s.image = nil
  s.category_id = 1
end

Product.seed do |s|
  s.id = 2
  s.price = 1000
  s.p_name = "アディダスの靴"
  s.description = "アディダスの靴"
  s.user_id = 1
  s.image = nil
  s.category_id = 1
end


Product.seed do |s|
  s.id = 3
  s.price = 1000
  s.p_name = "ナイキの靴"
  s.description = "ナイキの靴"
  s.user_id = 1
  s.image = nil
  s.category_id = 1
end

