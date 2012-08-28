class Product < ActiveRecord::Base
  attr_accessible :brand, :category, :description, :name, :price, :reviews_count
  has_many :reviews

  validates :brand, length: {minimum: 3}, :allow_blank => true
  #validates :brand, :description, :image_url, :presence => true
  #validates :price, presence: true, numericality: true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :name, :uniqueness => true, :on => :create
  #validates :name, presence:true,  length: { minimum: 3 }
  validate :is_free_price_must_be_0
  validate :free_category_and_price_zero

  before_save :fill_description


  def is_free_price_must_be_0
    if category == 'free' && price != 0
    # if category.eql?("free") && price != 0
      errors.add(:price, "must be 0 in free products")
    end
  end

  def fill_description
    if description.blank?
      self.description = name
    end
    # para una sentencia if debe hacerse como  selft.description = name if description.empty?
    # o con unless           selft.description = name unless description.empty?
    #def fill_description
    #  self.description = nombre if description.blank?
    #end

  end





end
