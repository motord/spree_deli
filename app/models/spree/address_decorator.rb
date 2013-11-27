module Spree
  Address.class_eval do

    Spree::PermittedAttributes.address_attributes << [:tower_id, :mobile, :window]

    validates :mobile, numericality: { only_integer: true }

    skips=[:lastname, :city, :country, :zipcode, :phone]

    clear_validators!
    skips.each do |skip|
      _validators.reject!{ |attribute, validations| attribute == skip }
      _validate_callbacks.each do |callback|
        callback.raw_filter.attributes.delete skip if callback.raw_filter.is_a?(ActiveModel::Validations::PresenceValidator)
      end
      _validate_callbacks.reject! do |callback|
        (callback.raw_filter.attributes.empty? || callback.raw_filter.attributes == [skip]) if callback.raw_filter.is_a?(ActiveModel::Validations::PresenceValidator)
      end
    end

    def state_validate
      # Skip state validation
      return
    end

  end
end