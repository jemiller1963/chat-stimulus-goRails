class AdminMailer < Devise::Mailer
  default from: 'admin@inked2gether.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'jemiller1963@gmail.com', subject: 'New User Awaiting Admin Approval')
  end
end
