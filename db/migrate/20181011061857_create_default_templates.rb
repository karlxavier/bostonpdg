class CreateDefaultTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :default_templates do |t|
      t.text :message

      t.timestamps
    end
  end
end
