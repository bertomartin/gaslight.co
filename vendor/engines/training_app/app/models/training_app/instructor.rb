require 'digest/md5'

module TrainingApp
  class Instructor < ActiveRecord::Base

    has_and_belongs_to_many :courses

  end
end

