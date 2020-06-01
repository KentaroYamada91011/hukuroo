# frozen_string_literal: true

FactoryBot.define do
  factory :payment_method, aliases: [:credit_card_payment_method], class: 'Spree::PaymentMethod::BogusCreditCard' do
    name { 'Credit Card' }
    available_to_admin { false }
    available_to_users { false }
  end

  factory :check_payment_method, class: 'Spree::PaymentMethod::Check' do
    name { 'Check' }
    available_to_admin { true }
    available_to_users { true }
  end

  # authorize.net was moved to spree_gateway.
  # Leaving this factory in place with bogus in case anyone is using it.
  factory :simple_credit_card_payment_method, class: 'Spree::PaymentMethod::SimpleBogusCreditCard' do
    name { 'Credit Card' }
    available_to_admin { false }
    available_to_users { false }
  end

  factory :store_credit_payment_method, class: 'Spree::PaymentMethod::StoreCredit' do
    name          { "Store Credit" }
    description   { "Store Credit" }
    active        { false }
    available_to_admin { false }
    available_to_users { false }
    auto_capture { false }
  end
end
