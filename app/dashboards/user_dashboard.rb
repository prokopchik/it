require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    articles: Field::HasMany,
    role: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    about: Field::Text,
    language: Field::Text,
    min_rating_article: Field::Text,
    blocked: Field::Boolean,
    theme: Field::Select.with_options(collection: ["newspaper", "magazine"])
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    articles
    role
    id
    name
    blocked
    theme
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    articles
    role
    id
    name
    email
    about
    language
    min_rating_article
    blocked
    theme
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    articles
    role
    name
    email
    about
    language
    min_rating_article
    blocked
    theme
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
  def display_resource(user)
    user.email
  end
end
