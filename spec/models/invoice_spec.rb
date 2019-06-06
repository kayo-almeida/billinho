require 'rails_helper'

# RSpec.describe Invoice, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe Invoice do 
  it "a soma das faturas devem ser igual ao valor da matriculo" do 
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


  
    expect(registration.invoices.sum(:invoice_amount)).to eq(registration.total_course_amount) 
  end 
end 
