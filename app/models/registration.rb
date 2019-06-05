class Registration < ApplicationRecord
  # relationships
  belongs_to :educational_institution
  belongs_to :student

  # validations
  validates :total_course_amount, presence :true
  validates :total_course_amount, numericality: { greater_than: 0 }

  validates :installments_number, presence :true
  validates :installments_number, numericality: { greater_than_or_equal_to: 1 }

  validates :due_day, presence :true
  validates :due_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }

  validates :course_name, presence :true

  validates :educational_institution, presence :true

  validates :student_id, presence :true

  # methods
end
