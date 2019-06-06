class Registration < ApplicationRecord
  # relationships
  has_many :invoices, dependent: :destroy
  belongs_to :educational_institution
  belongs_to :student



  # validations
  validates :total_course_amount, presence: true
  validates :total_course_amount, numericality: { greater_than: 0 }

  validates :installments_number, presence: true
  validates :installments_number, numericality: { greater_than_or_equal_to: 1 }

  validates :due_day, presence: true
  validates :due_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }

  validates :course_name, presence: true

  validates :educational_institution, presence: true

  validates :student_id, presence: true

  # methods
  after_create do
    # Check if due date has passed
    first_date = Date.new(Time.current.year, Time.current.month, self.due_day)
    first_date = first_date + 1.month if self.due_day >= Time.current.day

    for i in 0..(self.installments_number - 1) do
      t = Invoice.create!({
        invoice_amount: self.total_course_amount / self.installments_number,
        due_date: first_date + i.month,
        registration_id: self.id
      })
    end
  end
end
