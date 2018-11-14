class CreateDefaultWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :default_works do |t|
      t.string :description

      t.timestamps
    end
  end
end
