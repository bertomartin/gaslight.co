module TrainingApp
  class Section < ActiveRecord::Base
    belongs_to :course
    has_many :chapters

    validates :course, presence: true

    default_scope { order('sort_order') }
  end
end