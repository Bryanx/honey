class CompaniesController < ApplicationController

  before_action :require_user, only: [:index, :show, :new]

  def index
    @companies = current_user.companies
  end

  def show
    @company = Company.find(params[:id])
    @user = @company.user
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
    @company.build_contacts
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = session[:user_id]
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
    params.require(:company).permit(:name, contacts_attributes: [:first_name])
  end

end
