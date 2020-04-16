#Create a main sample user.
User.create!(email: "example@railstutoria.org",
              password:"foobar",
              password_confirmation: "foobar",
              username: "User1",
              first_name: "Example",
              last_name: "User",
              phone: "9986548595",
              gender: "Female",
              dob: "18May1998",
              city: "Lucknow",
              admin: true)
# Generate a bunch of additional users.
# 99.times do |n|
#   username = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   firstname = "Example#{n+1}"
#   lastname = "User"
#   phn = "9986548595"
#   gender = "Female"
#   dob = "18May199#{n+1}"
#   city =  "Lucknow"
#   User.create!(username: username,
#     email: email,
#     password: password,
#     password_confirmation: password,
#     first_name: firstname,
#     last_name: lastname,
#     phone: phn,
#     gender: gender,
#     dob: dob,
#     city: city,
#     )
# end
