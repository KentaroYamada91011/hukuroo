Spree::User.class_eval do
  has_one :user_billing, class_name: "Spree::UserBilling", dependent: :destroy
  has_many :purchased_items, class_name: "Spree::PurchasedItem", dependent: :destroy
end