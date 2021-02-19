User.create(
  username: 'admin',
  email: 'admin@mail.com',
  password: ENV.fetch('ADMIN_PASSWORD'),
  full_name: 'Admin'
)

Post.create(
  [
    {
      user: User.first,
      body: Faker::ChuckNorris.fact,
    },
    {
      user: User.first,
      body: Faker::Lorem.sentence
    }
  ]
)
