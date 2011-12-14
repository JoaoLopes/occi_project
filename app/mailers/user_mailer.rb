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
  
  def manager_mail(meeting)
    @meeting = meeting
    @manager = meeting.get_manager
    mail(:to => "#{@manager.name} <#{@manager.email}>", :subject => "Your new meeting data!")
  end
  
end
