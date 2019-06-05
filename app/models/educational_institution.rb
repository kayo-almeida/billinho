class EducationalInstitution < ApplicationRecord
    # validations
    validates :name, uniqueness: true
    validates :name, presence: true

    validates :cnpj, uniqueness: true
    validates :cnpj, presence: true
    validates :cnpj, numericality: { only_integer: true }

    # methods
    enum type: { "Universidade": 0, "Escola": 1, "Creche": 2 }
end
