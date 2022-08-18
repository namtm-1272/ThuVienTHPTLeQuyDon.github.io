# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do 
    Book.create([
        {
            title: Faker::Book.title,
            content: Faker::Lorem.paragraph(sentence_count: 4),
            author: Faker::Book.author,
            subject: Faker::Lorem.sentence(word_count: 2),
            image: Faker::LoremFlickr.image(size: "400x600"),
            describe: Faker::Lorem.paragraph(sentence_count: 2),
            publish_on: Time.now.to_s(:db),
            created_at: Time.now.to_s(:db),
            updated_at: Time.now.to_s(:db)
        }
    ])
end
