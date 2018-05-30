require "administrate/base_dashboard"

class StyleAttributeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      id: Field::Number,
      name: Field::String,
      height: Field::Number,
      width: Field::Number,
      finish: Field::String,
      value: Field::String,
      default: Field::String,
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
      :height,
      :width,
      :finish
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :id,
      :name,
      :height,
      :width,
      :finish,
      :created_at,
      :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
      :name,
      :height,
      :width,
      :finish
  ].freeze

  # Overwrite this method to customize how style attributes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(style_attribute)
  #   "StyleAttribute ##{style_attribute.id}"
  # end
  def display_resource(style_attribute)
    style_attribute.name
  end
end
