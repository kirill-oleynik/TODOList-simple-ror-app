AdminUser.create!(name: 'John Doe', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
