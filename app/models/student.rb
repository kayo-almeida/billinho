class Student < ApplicationRecord
    # relationships

    # validations
    validates :name, uniqueness: true
    validates :name, presence: true

    validates :cpf, uniqueness: true
    validates :cpf, presence: true
    validates :cpf, numericality: { only_integer: true }

    validates :phone, numericality: { only_integer: true }

    # methods
    enum gender: { "M": 0, "F": 1 }
    enum payment_method: { "Boleto": 0, "Cartão": 1 }
end