require "administrate/base_dashboard"

class DefaultAttributeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the input_type of each of the model's fields.
  #
  # Each different input_type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    field_name: Field::String,
    description: Field::String,
    input_type: Field::SelectBasic.with_options({
        choices: ['Text', 'Number', 'Date', 'File', 'Checkbox', 'Radio', 'Image', 'Password']
  }),
    user_id: Field::Hidden,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :field_name,
    :input_type,
    :description,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :field_name,
    :description,
    :input_type,
    :user_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :field_name,
    :description,
    :input_type,
    :user_id,
  ].freeze

  # Overwrite this method to customize how default attributes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(default_attribute)
  #   "DefaultAttribute ##{default_attribute.id}"
  # end
end
