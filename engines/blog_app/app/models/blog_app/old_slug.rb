module BlogApp
  class OldSlug < ActiveRecord::Base
    belongs_to :post
  end
end