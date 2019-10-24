Spree::User.class_eval do
  has_one :user_billing, class_name: "Spree::UserBilling", dependent: :destroy
end