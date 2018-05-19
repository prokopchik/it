role_member = Role.create!(name: "Member")
role_writer = Role.create!(name: "Writer")
role_admin = Role.create!(name: "Admin")

user_ihar = User.new(name: "Ihar",
										 email: "iharprokop@gmail.com",
										 password: 12345678,
										 about: "Hello, i'm admin of this site",
										 role: role_admin,
										 language: "ru")