require 'spec_helper'

module TrainingApp
  describe Course do

    it { should have_many(:registrations) }

  end
end

