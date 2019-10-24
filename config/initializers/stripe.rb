Rails.configuration.stripe = {
  :publishable_key => "pk_test_hufnzJCzH154YMTnGtYkA4K100EIGElPJi",
  :secret_key      => "sk_test_rcWv8tI0YPeR6NWRSdZx4QAn00VJzSLxgC"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]