User.seed do |s|
  s.id = 1
  s.email = "admin1@test"
  s.password = "admin1"
  s.role = 1
end


i = 1

while i < 10 do

  User.seed do |s|
    s.id = 1 + i
    s.email = "admin#{1+i}@test"
    s.password = "admin#{1+i}"
    s.role = 0
  end

  i += 1
end
