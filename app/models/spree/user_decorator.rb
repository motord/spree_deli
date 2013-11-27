module Spree
  User.class_eval do
    Spree::PermittedAttributes.user_attributes << [:mobile, :wechat]
  end
end