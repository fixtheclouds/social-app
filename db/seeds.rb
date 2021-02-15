User.create(
  username: 'admin',
  email: 'admin@mail.com',
  password: ENV.fetch('ADMIN_PASSWORD'),
  full_name: 'Admin'
)
