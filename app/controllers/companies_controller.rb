class CompaniesController < ApplicationController

  before_action :require_user, only: [:index, :show, :new]

  def index
    @companies = current_user.companies
  end

  def show
    @company = Company.find(params[:id])
    @contacts = @company.contacts
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.user_id = session[:user_id]
    if @company.update_attributes(company_params)
      redirect_to(:action => 'show', :id => @company.id)
    else
      render 'edit'
    end
  end

  def new
    @company = Company.new
    @company.user_id = session[:user_id]
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to '/', :notice => "company has been deleted"
  end

  def company_params
    params.require(:company).permit(:company_image, :name, :company_type, :phone_number, :address, :country, :founded, :spokesman, :website)
  end

end
