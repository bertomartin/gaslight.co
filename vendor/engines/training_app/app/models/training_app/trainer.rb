require 'digest/md5'

module TrainingApp
  class Trainer < ActiveRecord::Base
    #attr_accessible :name, :gravatar_email, :bio, :as => :admin
    has_and_belongs_to_many :courses

    before_validation :normalize_email
    validates :gravatar_email, :uniqueness => true, :presence => true


    def gravatar_url(size = 200)
      hash = Digest::MD5.hexdigest(gravatar_email)
      image_src = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
    end

    private

    def normalize_email
      self.gravatar_email = self.gravatar_email.strip.downcase if self.gravatar_email.present?
    end

  end
end

