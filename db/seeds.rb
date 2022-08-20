# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ClassUser.create!(name: "", grade: "")
User.create!(name: "Thay Trong Beo",
            email: "thanminhnam@gmail.com",
            password:"123456",
            password_confirmation: "123456",
            Tk: "admin123456",role: 0, class_user_id: 1)
Access.create!(num_access: 0)
