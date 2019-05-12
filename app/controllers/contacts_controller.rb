class ContactsController < ApplicationController
  def index
    @contacts = User.find(params[:user_id]).contacts
  end

  def show
    @contact = User.find(params[:user_id]).contacts.find params[:id]
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = User.find(params[:user_id]).contacts.create contact_params

    if @contact.save
      redirect_to user_contact_path(params[:user_id], @contact.id)
    else
      render action: :new
    end
  end

  def edit
    @contact = Contact.find params[:id]
  end

  def update
    @contact = Contact.find params[:id]

    if @contact.update contact_params
      redirect_to user_contact_path(params[:user_id], @contact.id)
    else
      render action: :edit
    end
  end

  def destroy
    @contact = Contact.find params[:id]
    @contact.destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:name)
  end
end
