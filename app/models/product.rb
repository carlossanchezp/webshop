class Product < ActiveRecord::Base
  attr_accessible :brand, :category, :description, :name, :price

  has_many :reviews, :dependent => :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: true
  validates :brand, presence: true
  validates :category, presence: true

  validate :free_category_and_price_zero

  before_save :fill_description

  def free_category_and_price_zero
    if category.eql?("free") && price != 0
      errors.add(:base, "The price must be 0")
    end
  end

  def fill_description
    self.description = name if description.blank?
  end
end
