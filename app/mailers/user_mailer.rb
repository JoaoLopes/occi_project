class UserMailer < ActionMailer::Base
  default :from => "noreply@eMeeting.com"
  
  def hello_world(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Hi")
  end
  
end
