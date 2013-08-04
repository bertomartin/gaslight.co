module TrainingApp
  class Registration < ActiveRecord::Base
    attr_accessor :freebie
    #attr_accessible :amount, :stripe_token, :name, :email, :organization, :phone,
    #  :workshop, :workshop_id, :referral_token, :code, :freebie

    belongs_to :workshop

    before_create :charge_stripe, unless: :freebie
    validate :ensure_workshop_capacity, :on => :create
    after_create :send_confirmation
    validates_presence_of :name, :email
    validates_uniqueness_of :code
    before_validation :generate_code, on: :create

    private

    def ensure_workshop_capacity
      errors.add(:workshop_id, "is full") if self.workshop && self.workshop.full?
    end

    def charge_stripe
      # create a Customer
      customer = Stripe::Customer.create(:card => stripe_token, :email => email, :description => name)
      self.customer_id = customer.id
      # charge the Customer instead of the card
      Stripe::Charge.create(:amount => amount * 100, # in cents
                            :currency => "usd",
                            :description => "Ember and Backbone Videos",
                            :customer => customer_id)
    rescue Exception => e
      Rails.logger.error e
      errors.add :base, e.message
      false
    end

    def send_confirmation
      Confirmation.registered(self).deliver
    end

    def generate_code
      self.code = Digest::MD5.hexdigest("#{self.email}#{Time.now}")
    end
  end
end

