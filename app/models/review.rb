class Review < ActiveRecord::Base
  attr_accessible :description, :rating_integer, :summary
  belongs_to :product, :counter_cache => true #counter_cache implementa un contador automatico
  belongs_to :user


  #after_save :add_count_product
  #after_destroy :sus_count_product

 # def add_count_product

 #   self.product.increment! :review_count

 # end


  #def sus_count_product

  #  self.product.decrement! :review_count

  #end
end
