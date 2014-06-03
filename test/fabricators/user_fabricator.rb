Fabricator(:user) do
  email      { Faker::Internet.email }
  password   { Faker::Lorem.word }
  admin false
end

Fabricator(:admin, from: :user) do
  email 'admin@example.com'
  admin true
end
