module TrainingApp
  class Registration < ActiveRecord::Base
    attr_accessor :freebie

    belongs_to :course

    validates_presence_of :name, :email, :course
    validates_uniqueness_of :code
    before_validation :generate_code, on: :create, unless: Proc.new { |r| r.code.present? }

    def purchase!
      self.amount = course.price
      customer = Customer.generate(token: stripe_token, email: email, name: name)
      self.customer_id = customer.id
      customer.charge(amount: amount, description: course.title)
      if customer.error.blank?
        send_confirmation
        save!
      else
        errors.add :base, customer.error
      end
    end

    private

    def send_confirmation
      Confirmation.registered(self).deliver
    end

    def generate_code
      self.code = Digest::MD5.hexdigest("#{self.email}#{Time.now}")
    end
  end
end

