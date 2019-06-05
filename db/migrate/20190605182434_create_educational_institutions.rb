class CreateEducationalInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :educational_institutions do |t|
      t.string :name, null: false
      t.string :cnpj, null: false
      t.integer :institution_type, null: false

      t.timestamps
    end
    add_index :educational_institutions, :name, unique: true
    add_index :educational_institutions, :cnpj, unique: true
  end
end
