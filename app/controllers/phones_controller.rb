
class PhonesController < ApplicationController
  def index
    @phones = Contact.find(params[:contact_id]).phones
  end

  def show
    @phone = Contact.find(params[:contact_id]).phones.find params[:id]
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = Contact.find(params[:contact_id]).phones.create phone_params

    if @phone.save
      redirect_to user_contact_phones_path(params[:user_id], params[:contact_id], @phone.id)
    else
      render action: :new
    end
  end

  def edit
    @phone = Phone.find params[:id]
  end

  def update
    @phone = Phone.find params[:id]

    if @phone.update(phone_params)
      redirect_to user_contact_phones_path(params[:user_id], params[:contact_id], @phone.id)
    else
      render :edit
    end
  end

  def destroy
    @phone = Phone.find params[:id]
    @phone.destroy
  end

  private

  def phone_params
    params.require(:phone).permit(:number, :default_phone)
  end
end
