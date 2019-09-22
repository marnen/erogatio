class AddPaymentInfoToWorkUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :work_units, :pay, :decimal, precision: 10, scale: 2
    add_column :work_units, :payment_due, :date
  end
end
