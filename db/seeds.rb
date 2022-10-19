require "faker"

# User.destroy_all
Contract.destroy_all

# i = 10000000
# 10.times do |n|
# 	User.create(name: Faker::Name.first_name,
# 							surname: Faker::Name.middle_name,
# 							doc_id: "#{i+1}A",
# 							doc_kind: :dni,
# 							email: "user#{n+1}@gmail.com",
# 							birthdate: Faker::Date.between(from: 70.years.ago, to: 18.years.ago).strftime("%d/%m/%Y"),
# 							address: Faker::Address.street_address,
# 							city: Faker::Address.city,
# 							postalcode: Faker::Number.leading_zero_number(digits: 5),
#               password: "xxxxxx",
# 							role: :customer
# 							)
# 	end

100.times do |n|
  Contract.create(title: Faker::Hacker.abbreviation,
                  desc: Faker::Hacker.say_something_smart,
                  kind: Faker::Hacker.adjective,
                  status: Faker::Number.between(from: 0, to: 6),
                  owner: User.find(rand(1..10)),
                  beneficiary: User.find(rand(1..10)),
                  payable: Faker::Boolean.boolean)
end