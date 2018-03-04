class ContactMailer < ActionMailer::Base
  
  default to: "martinez.irvint@gmail.com"
  
  def contact_email(name, phoneNumber, body)
  
    @name = name
    @phoneNumber = phoneNumber
    @body = body
    
    mail(from: email, subject: "Contact Form Message")
  
  
  end
  
end