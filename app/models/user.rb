class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  def self.opponents(user_email)
  	opponent_emails = Array.new
  	User.all.each do |u|
  		opponent_emails << u.email if u.email != user_email
  	end
  	opponent_emails
  end
end
