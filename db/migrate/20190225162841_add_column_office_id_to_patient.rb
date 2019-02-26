class AddColumnOfficeIdToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :office_id, :integer
  end
end
