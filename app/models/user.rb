class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_many :reviews
  has_secure_password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 50 }
  validates :email, :presence => true, :length => { :maximum => 100 },
            :format => EMAIL_REGEX, :confirmation => true


  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader   :password
  validate     :password_must_be_present

  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end

end
