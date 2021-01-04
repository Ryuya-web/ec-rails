# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)
Genre.create!(
    [
      {
        name: 'ケーキ',
        is_valid: true
      },
      {
        name: 'シュークリーム',
        is_valid: true
      }
    ]
  )
Item.create!(
    [
      {
        genre_id: 1,
        description: 'おいしい',
        tax_excluded_price: 200,
        name: 'ショートケーキ',
        image: File.open('./app/assets/images/rr.jpg'),
        is_unsaled: false

      },
      {
        genre_id: 2,
        description: 'おいしい',
        tax_excluded_price: 500,
        name: 'チョコレートケーキ',
        image: File.open('./app/assets/images/choco.jpg'),
        is_unsaled: false
      }
    ]
  )
  
