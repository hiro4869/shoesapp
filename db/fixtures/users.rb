# 管理ユーザーを作成
User.seed do |s|
  s.id = 1
  s.email = "admin1@test"
  s.password = "admin1"
  s.role = 1
end



通常のユーザーを作成
i = 0
while i < 10 do

  User.seed do |s|
    s.id = 1 + i
    s.email = "users#{i}@test"
    s.password = "users#{i}"
    s.role = 0
  end

  i += 1
end
