class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :invoice_amount, precision: 8, scale: 2, null: false
      t.date :due_date, null: false
      t.references :registration, foreign_key: true, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
