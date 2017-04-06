i = 1

while i < 100 do

  Product.seed do |s|
    s.id = i
    s.price = i * 1000
    s.p_name = "#{i}太郎"
    s.description = "#{i}太郎です"
    s.user_id = i
    s.image = nil
  end

  i += 1
end

