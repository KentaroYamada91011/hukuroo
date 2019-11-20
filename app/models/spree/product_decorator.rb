Spree::Product.class_eval do
  has_one :purchased_item, class_name: "Spree::PurchasedItem", dependent: :destroy
end