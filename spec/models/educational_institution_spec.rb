require 'rails_helper'

# RSpec.describe EducationalInstitution, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe EducationalInstitution do 
  it "deve contar o campo nome" do 
    educational_institution = EducationalInstitution.new({
      name: nil
    })
    educational_institution.valid? 
    expect(educational_institution.errors[:name]).to include("can't be blank") 
  end 
end

describe EducationalInstitution do 
  it "o cnpj deve ser único" do 
    educational_institution = EducationalInstitution.create({
      name: "Anhanguera",
      cnpj: "49849665000163",
      institution_type: "Universidade"
    })

    educational_institution = EducationalInstitution.new({
      name: "Unopar",
      cnpj: "49849665000163",
      institution_type: "Universidade"
    })
    
    educational_institution.valid?
    expect(educational_institution.errors[:cnpj]).to include("has already been taken")
  end 
end

describe EducationalInstitution do 
  it "os campos name, cnpj e institution_type devem ser preenchidos corretamente" do 
    educational_institution = EducationalInstitution.new({
      name: "Unip",
      cnpj: "62715336000198",
      institution_type: "Universidade"
    }) 
   
   educational_institution.valid?
   expect(educational_institution).to be_valid 
  end 
end