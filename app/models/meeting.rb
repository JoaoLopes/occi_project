class Meeting < ActiveRecord::Base
  
  has_many :meeting_people
  has_many :users, :through => :meeting_people
  has_many :topics
  
  validates_presence_of :user_link
  validates_uniqueness_of :user_link
  validates_uniqueness_of :manager_link
  validates_presence_of :manager_link
  
  def self.get_new_link(size = 30)
    alphanumerics = [('0'..'9'),('A'..'Z'),('a'..'z')].map {|range| range.to_a}.flatten
    return (0..size).map { alphanumerics[Kernel.rand(alphanumerics.size)] }.join
  end
  
  def get_manager
    return User.find_by_id(self.meeting_people.find_by_manager(true))
  end
  
  def get_guests
    guests = []
    meeting_people = self.meeting_people
    meeting_people.each do |meet_person|
      if !meet_person.manager
        guests << User.find_by_id(meet_person.user_id)
      end
    end
    return guests
  end
  
end
