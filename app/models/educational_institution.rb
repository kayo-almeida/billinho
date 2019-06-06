class EducationalInstitution < ApplicationRecord
    # relationships
    has_many :registrations, dependent: :destroy
    
    # validations
    validates :name, uniqueness: true
    validates :name, presence: true
    
    validates :institution_type, presence: true

    validates :cnpj, uniqueness: true
    validates :cnpj, presence: true
    validates :cnpj, numericality: { only_integer: true }

    # methods
    enum institution_type: { "Universidade": 0, "Escola": 1, "Creche": 2 }
end
