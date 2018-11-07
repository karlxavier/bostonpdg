class CreateTimeLogWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :time_log_works do |t|
      t.string :description

      t.timestamps
    end
  end
end
