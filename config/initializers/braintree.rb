Dotenv.load if Rails.env.development?

$gateway = Braintree::Gateway.new(
  :environment => :sandbox,
  :merchant_id => ENV['BRAINTREE_MERCHANT_ID'],
  :public_key => ENV['BRAINTREE_PUBLIC_KEY'],
  :private_key => ENV['BRAINTREE_PRIVATE_KEY'],
)
# Braintree::Configuration.environment = :sandbox
# Braintree::Configuration.logger = Logger.new('log/braintree.log')
# Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
# Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
# Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']