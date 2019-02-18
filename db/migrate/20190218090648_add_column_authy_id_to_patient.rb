class AddColumnAuthyIdToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :authy_id, :string
    add_column :patients, :area_code, :string
    add_column :patients, :pin, :string
  end
end
