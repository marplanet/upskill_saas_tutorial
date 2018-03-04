class ContactsController < ApplicationController
  #GET request to /contact-us
  #Show new contact form
  def new
      @contact = Contact.new
  end
  #POST Request /contacts
    def create
      #Mass assignments of form fields into Contact obj
      @contact = Contact.new(contact_param)
      # Save the contact obj to the database 
      if @contact.save
        
        #Store form fields parameters into variables
        name = params[:contact][:name]
        phoneNumber = params[:contact][:phoneNumber]
        body = params[:contact][:comments]
        
        #Plug variables into Contact Mailer email method then send email
        ContactMailer.contact_email(name, phoneNumber, body).deliver
        
        #Store success message in flash hash and redirect to the new action
        flash[:success] = "Message Sent!"
        redirect_to new_contact_path
      
      else
        #if Contact obj doesn't save
        flash[:danger] = "Please fill out entire form"
        redirect_to new_contact_path
      end
    end
    
    #To collect data from form, we need to use STRONG parameters
    #whitelist the form fields
    private
      def contact_param
        params.require(:contact).permit(:name, :phoneNumber, :comments)
      
      end
  
end



  