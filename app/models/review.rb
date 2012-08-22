class Review < ActiveRecord::Base
  attr_accessible :description, :rating_integer, :summary
end
