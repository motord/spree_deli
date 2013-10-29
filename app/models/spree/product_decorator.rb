module Spree
  Product.class_eval do
    scope :weekday, -> { joins(:properties).where("#{::Spree::Property.quoted_table_name}.name='Weekday'")}

    scope :sunday, -> { weekday.where("#{::Spree::ProductProperty.quoted_table_name}.value='0'")}
    scope :monday, -> { weekday.where("#{::Spree::ProductProperty.quoted_table_name}.value='1'")}
    scope :tuesday, -> { weekday.where("#{::Spree::ProductProperty.quoted_table_name}.value='2'")}
    scope :wednesday, -> { weekday.where("#{::Spree::ProductProperty.quoted_table_name}.value='3'")}
    scope :thursday, -> { weekday.where("#{::Spree::ProductProperty.quoted_table_name}.value='4'")}
    scope :friday, -> { weekday.where("#{::Spree::ProductProperty.quoted_table_name}.value='5'")}
    scope :saturday, -> { weekday.where("#{::Spree::ProductProperty.quoted_table_name}.value='6'")}

    scope :everyday, -> { where.not(id: Product.weekday )}

  end
end