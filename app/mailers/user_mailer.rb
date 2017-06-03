class UserMailer < ApplicationMailer

  def request_login(user)
   @site_administrator = Contact.find_by(title: "Information Systems Manager")
   @director = Contact.find_by(title: "Agency Director")
   @url  = 'http://skcdc.org/users/new'
   mail(to: "rachel.salois@gmail.com", subject: 'Welcome to My Awesome Site')
 end
end
end
