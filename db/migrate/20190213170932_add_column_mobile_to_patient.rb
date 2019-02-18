class AddColumnMobileToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :mobile_no, :string
  end
end
