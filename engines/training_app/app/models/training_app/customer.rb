module TrainingApp
  class Customer

    attr_accessor :error, :stripe_customer

    def initialize(stripe_customer)
      self.stripe_customer = stripe_customer
    end

    def self.generate(options)
      new(Stripe::Customer.create(card: options[:token], email: options[:email], description: options[:name]))
    end

    def id
      stripe_customer.id
    end

    def charge(options)
      Stripe::Charge.create(amount: options[:amount] * 100,
                            currency: "usd",
                            description: options[:description],
                            customer: id)
    rescue Exception => e
      Rails.logger.error e
      self.error = e.message
      false
    end
  end
end