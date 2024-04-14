class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@microblog.com'
  layout 'mailer'
end
