module TrainingApp
  class Course < ActiveRecord::Base
    #attr_accessible :title, :description_main, :description_close,
    #                :start_date, :end_date, :price, :venue_id #, :as => :admin
    # add :charge_description too?

    has_and_belongs_to_many :instructors
    has_many :workshops

    validate :start_date, :uniqueness => { :scope => :venue_id },
        :message => "One course at a time per venue, please."

  end
end

