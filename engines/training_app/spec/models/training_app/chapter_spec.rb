require 'spec_helper'

module TrainingApp
  describe Chapter do
    it { should have_one(:course) }
  end
end