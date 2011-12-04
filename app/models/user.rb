require 'digest/sha1'
class User < ActiveRecord::Base
  
  has_many :meeting_people
  has_many :meetings, :through => :meeting_people
  has_many :action_items
  
  attr_accessor :password
  
  validates :email, :presence => true, :uniqueness => true
  validates :name, :length => {:maximum => 50}
  validates :password,
                :confirmation => true,
                :length => {:maximum => 40}
  
  before_save :create_hashed_password
  after_save :clear_password
  
  attr_protected :hashed_password, :salt
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} in the #{password}")
  end
  
  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Make salt with #{username} and #{Time.now} to make salt")
  end
  
  def self.authenticate(username="", password="")
    user = User.find_by_email(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end
  
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end
  
  private
  
  def create_hashed_password
    unless password.blank?
      self.salt = User.make_salt(email) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end
  
  def clear_password
    self.password = nil
  end
  
end
