unless User.first
  PASSWORD = 'secret'
  User.create email: 'admin@example.com', password: PASSWORD, password_confirmation: PASSWORD, admin: true
end
