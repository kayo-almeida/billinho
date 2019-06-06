require 'rails_helper'

# RSpec.describe Registration, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Registration do 
  it "deve contar o campo total_course_amount" do 
    registration = Registration.new({
      total_course_amount: nil
    })

    registration.valid? 
    expect(registration.errors[:total_course_amount]).to include("can't be blank") 
  end 
end

describe Registration do 
  it "installments_number deve ser maior ou igual a um" do 
    registration = Registration.new({
      installments_number: 0
    })

    registration.valid? 
    expect(registration.errors[:installments_number]).to include("must be greater than or equal to 1") 
  end 
end


describe Registration do 
  it "quando criar uma matricula X faturas devem ser criadas" do 
    student = Student.create!({
      name: "Kayo Almeida",
      cpf: "12345678901",
      payment_method: "Cartão",
      gender: "M"
    }) 

    educational_institution = EducationalInstitution.create!({
      name: "Unip",
      cnpj: "62715336000198",
      institution_type: "Universidade"
    }) 

    registration = Registration.create!({
      total_course_amount: 2000.00,
      installments_number: 5,
      due_day: 10,
      course_name: "Curso de teste",
      educational_institution_id: educational_institution.id,
      student_id: student.id
    }) 
   
   expect(registration.invoices.count).to eq(5) 
  end 
end