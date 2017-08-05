class ContactsController < ApplicationController

  before_action :require_user, only: [:index, :show, :new]

  def index
    search = params[:term].present? ? params[:term] : nil
    @contacts = if search
                  # Movie.where("title LIKE ? OR plot LIKE ?", "%#{search}%", "%#{search}%")
                  current_user.contacts.search(search)
                else
                  current_user.contacts
                end
  end

  def show
    @contact = Contact.find(params[:id])
    @user = @contact.user
    @companies = @contact.companies
    @companies.each do |c|
      @company_id = "/companies/#{c.id}"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.user_id = session[:user_id]
    respond_to do |format|
      if @contact.update_attributes(contact_params)
        format.js {}
        redirect_to(:action => 'show', :id => @contact.id)
      else
        render 'edit'
      end
    end
  end

  def new
    @contact = current_user.contacts.new
    @contact_company = @contact.companies.build
  end

  def create_new_comp
    counter = 0
    f = Company.all.length-1
    Company.all[0..f].each do |a|
      if a.name.downcase == Company.last.name.downcase && counter == 0
        Job.last.update(:company_id => a.id)
        counter = counter + 1
      end
    end
    Company.all.each do |comp|
      if comp.contacts.empty?
        comp.destroy
      end
    end
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      Job.last.company.update(:user_id => current_user.id)

      create_new_comp

      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to '/', :notice => "Contact has been deleted"
  end

  def favorites
    @contacts = current_user.contacts.where(favorite: true)
  end

  def fav_toggle
    @contact = Project.find(params[:id])
    @contact.favorite = true
    @contact.save
  end

  helper_method :fav_toggle

  private
  def contact_params
    params.require(:contact).permit(:contact_image, :first_name, :favorite, :last_name, :birthday, :website,
                                    :notes, :address, :phone_number1, companies_attributes: [:user_id, :name])
  end

end
