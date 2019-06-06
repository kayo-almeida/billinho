require 'rails_helper'

# describe Student do 
#  pending "add some examples to (or delete) #{__FILE__}" 
# end

describe Student do 
  it "deve contar o campo nome" do 
    student = Student.new({
      name: nil
    })
    student.valid? 
    expect(student.errors[:name]).to include("can't be blank") 
  end 
end

describe Student do 
  it "o cpf deve ser único" do 
    student = Student.create({
      name: "Kayo Almeida",
      cpf: "12345678901",
      payment_method: "Boleto",
      gender: "M"
    })

    student = Student.new({
      name: "Kayo Nascimento",
      cpf: "12345678901",
      payment_method: "Boleto",
      gender: "M"
    })
    
    student.valid?
    expect(student.errors[:cpf]).to include("has already been taken")
  end 
end

describe Student do 
  it "os campos name, cpf, gender e payment_method devem ser preenchidos corretamente" do 
    student = Student.new({
      name: "Kayo Almeida",
      cpf: "12345678901",
      payment_method: "Cartão",
      gender: "M"
    }) 
   
   student.valid?
   expect(student).to be_valid 
  end 
end