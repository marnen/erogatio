class CreateWorkUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :work_units do |t|
      t.date :date, null: false
      t.string :description
      t.interval :hours, null: false # TODO: should we specify precision here?
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
