module TrainingApp
  class Chapter < ActiveRecord::Base
    belongs_to :section
    validates :section, presence: true
  end
end