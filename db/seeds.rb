role_member = Role.create!(name: 'Member')
role_writer = Role.create!(name: 'Writer')
role_admin = Role.create!(name: 'Admin')

user_ihar = User.create!(name: 'Ihar',
                         email: 'iharprokop@gmail.com',
                         password: 12_345_678,
                         about: "Hello, i'm admin of this site",
                         role: role_admin,
                         language: 'ru')
user_kos = User.create!(name: 'Konstantin',
                        email: 'koszenin@gmail.com',
                        password: 1_234_567_890,
                        about: "Hello, i'm writer of this site",
                        role: role_writer,
                        language: 'ru')

user_ihar.confirm
user_kos.confirm

article_1 = Article.create!(title: "Рецензия на 'Дэдпул 2'",
                            short_description: "После эффектной вступительной сцены «Дэдпул 2» все еще заигрывает с любовной темой.",
                            body: 'После эффектной вступительной сцены «Дэдпул 2» все еще заигрывает с любовной темой. Правда, не проходит и десятка минут, как она обрывается на полуслове. Наш суперантигерой в красных штанишках аж взгрустнул и задумал свести счеты с жизнью. Ничего у него, естественно, из этой затеи не выходит.',
                            user: user_ihar)
