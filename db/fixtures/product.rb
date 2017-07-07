i = 1

while i < 6 do

  Product.seed do |s|
    s.id = i
    s.price = i * 1000
    s.p_name = "#{i}太郎の靴"
    s.description = "#{i}太郎の靴です"
    s.user_id = i
    s.image = nil
    s.category_id = rand(1..4)
  end

  i += 1
end

