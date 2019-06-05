class Invoice < ApplicationRecord
  # relationships
  belongs_to :registration

  # validations
  validates :invoice_amount, presence :true

  validates :due_date, presence :true

  validates :registration, presence :true
  
  validates :status, presence :true

  # methods
  enum type: { "Aberta": 0, "Atrasada": 1, "Paga": 2 }
end
