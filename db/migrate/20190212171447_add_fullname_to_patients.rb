class AddFullnameToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :full_name, :string
  end
end
