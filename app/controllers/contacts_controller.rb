class ContactsController < ApplicationController

  before_action :require_user, only: [:index, :show, :new]

  def index
    @contacts = current_user.contacts
  end

  def show
    @contact = Contact.find(params[:id])
    @user = @contact.user
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.user_id = session[:user_id]
    if @contact.update_attributes(contact_params)
      redirect_to(:action => 'show', :id => @contact.id)
    else
      render 'edit'
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = session[:user_id]
    @contact.save
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to '/', :notice => "Contact has been deleted"
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name)
  end

end
