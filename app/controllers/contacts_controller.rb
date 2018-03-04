class ContactsController < ApplicationController

def new
    @contact = Contact.new
end

  def create
    
    @contact = Contact.new(contact_param)
      
    if @contact.save
      flash[:success] = "Message Sent!"
      name = params[:contact][:name]
      phoneNumber = params[:contact][:phoneNumber]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, phoneNumber, body).deliver
      redirect_to new_contact_path
    else
      flash[:danger] = "Please fill out entire form"
      redirect_to new_contact_path
    end
  end
  private
    def contact_param
      params.require(:contact).permit(:name, :phoneNumber, :comments)
    
    end
  
end



  