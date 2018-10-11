class AddTemplateTypeToDefaultTemplates < ActiveRecord::Migration[5.1]
  def change
    add_column :default_templates, :template_type, :string
  end
end
