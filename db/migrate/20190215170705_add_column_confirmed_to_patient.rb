class AddColumnConfirmedToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :confirmed, :boolean, default: false
    add_column :patients, :confirmed_at, :datetime
  end
end
