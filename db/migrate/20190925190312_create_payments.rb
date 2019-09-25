class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.date :date, null: false
      t.references :work_unit, foreign_key: true, null: false

      t.timestamps
    end
  end
end
