User.create(
  email: 'pierre@michaux.com',
  password: 'progenitor'
)

User.create(
  email: 'busko.bogdan@gmail.com',
  password: '123456'
)

User.create(
  email: 'test.email@gmail.com',
  password: '123456'
)


SaveTwitterData.save_user('busko_bogdan', User.where(email: 'pierre@michaux.com').first.id)
SaveTwitterData.save_user('bbsnews', User.where(email: 'pierre@michaux.com').first.id)
SaveTwitterData.save_user('CommonWhiteGrls', User.where(email: 'pierre@michaux.com').first.id)