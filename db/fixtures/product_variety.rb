i = 1

while i < 6 do

  ProductVariety.seed do |s|
    s.id = i * 6 - 5
    s.product_id = i
    s.color = "red"
    s.size = "26.0"
    s.price = i * 1000
  end

  ProductVariety.seed do |s|
    s.id = i * 6 - 4
    s.product_id = i
    s.color = "red"
    s.size = "27.0"
    s.price = i * 1000
  end

  ProductVariety.seed do |s|
    s.id = i * 6 - 3
    s.product_id = i
    s.color = "red"
    s.size = "28.0"
    s.price = i * 1000
  end

  ProductVariety.seed do |s|
    s.id = i * 6 - 2
    s.product_id = i
    s.color = "blue"
    s.size = "26.0"
    s.price = i * 1000
  end

  ProductVariety.seed do |s|
    s.id = i * 6 - 1
    s.product_id = i
    s.color = "blue"
    s.size = "27.0"
    s.price = i * 1000
  end

  ProductVariety.seed do |s|
    s.id = i * 6 - 0
    s.product_id = i
    s.color = "blue"
    s.size = "28.0"
    s.price = i * 1000
  end

  i += 1
end



