module TrainingApp
  class Chapter < ActiveRecord::Base
    belongs_to :section
  end
end