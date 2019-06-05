require 'faker'

### CREATING STUDENTS
for i in 0..9 do
    Student.create!({
        name: Faker::Name.unique.name,
        cpf: Faker::Number.number(11),
        birthday: Faker::Date.birthday(18, 60),
        phone: Faker::Number.number(11),
        gender: Faker::Number.between(0, 1),
        payment_method: Faker::Number.between(0, 1)
    })
end

## CREATING EDUCATIONAL INSTITUTION
for i in 0..9 do
    EducationalInstitution.create!({
        name: Faker::Company.name,
        cnpj: Faker::Number.number(14),
        institution_type: Faker::Number.between(0, 2)
    })
end