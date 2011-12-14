class UserMailer < ActionMailer::Base
  default :from => "noreply@eMeeting.com"
  
  def hello_world(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Hi")
  end
  
  def guest_mail(meeting, user)
    @meeting = meeting
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "A new meeting awaits you")
  end
  
end
