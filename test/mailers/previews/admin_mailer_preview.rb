class AdminMailerPreview < ActionMailer::Preview
  
  def new_user_waiting_for_approval
    user = User.new(username: 'Testing', 
                    email: 'testing@test.com', 
                    memos: 'This is another test')
    AdminMailer.with(user: user).new_user_waiting_for_approval
  end
end
