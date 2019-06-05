class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.decimal :total_course_amount, precision: 8, scale: 2, null: false
      t.integer :installments_number, null: false
      t.integer :due_day, null: false
      t.string :course_name, null: false
      t.references :educational_institution, foreign_key: true, null: false
      t.references :student, foreign_key: true, null: false

      t.timestamps
    end
  end
end
