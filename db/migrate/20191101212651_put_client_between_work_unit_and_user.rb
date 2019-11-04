class PutClientBetweenWorkUnitAndUser < ActiveRecord::Migration[5.2]
  def change
    reversible {|direction| direction.down { change_column_null :work_units, :user_id, false } }
    change_table :work_units do |t|
      t.references :client, foreign_key: true
    end
    convert_between_client_and_user_keys!
    reversible do |direction|
      direction.up { remove_column :work_units, :user_id }
      direction.down do
        change_table(:work_units) {|t| t.references :user, foreign_key: true }
      end
    end
    change_column_null :work_units, :client_id, false
  end

  private

  def convert_between_client_and_user_keys!
    reversible do |direction|
      say_with_time 'Converting keys...' do
        WorkUnit.all.each do |work_unit|
          direction.up { convert_user_to_client! work_unit }
          direction.down { convert_client_to_user! work_unit }
        end
      end
      say 'Done!'
    end
  end

  def convert_user_to_client!(work_unit)
    user = User.find work_unit.user_id # can't rely on associations while migrating the same class
    client = user.clients.order(:created_at).first || user.clients.create!(name: 'Unknown Client')
    work_unit.update_attributes! client_id: client.id
    say_conversion work_unit, from: user, to: client
  end

  def convert_client_to_user!(work_unit)
    client = Client.find work_unit.client_id
    user = client.user
    work_unit.update_attributes! user_id: client.user_id
    say_conversion work_unit, from: client, to: user
  end

  def say_conversion(work_unit, from:, to:)
    strings = [from, to].map do |value|
      string = "#{value.class.name} #{value.id} "
      string += value.kind_of?(User) ? value.email : value.name
    end
    say "WorkUnit #{work_unit.id} #{work_unit.description}: #{strings.join ' -> '}"
  end
end
