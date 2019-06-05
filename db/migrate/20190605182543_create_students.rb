class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.date :birthday, default: nil
      t.integer :phone, default: nil
      t.integer :gender, null: false
      t.integer :payment_method, null: false

      t.timestamps
    end
    add_index :students, :name, unique: true
    add_index :students, :cpf, unique: true
  end
end
