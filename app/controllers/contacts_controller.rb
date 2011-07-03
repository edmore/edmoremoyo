class ContactsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  before_filter :load_user
  before_filter :load_contacts
  before_filter :load_contact
  before_filter :button_condition

  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Message sent, I will get in touch with you shortly."
      redirect_to get_in_touch_path
    else
      render :action => "new"
    end
  end

  def destroy
    if @contact.destroy
      flash[:notice] = 'Contact info successfully deleted.'
    else
      flash[:error] = 'Contact info could not be deleted.'
    end
      redirect_to contacts_path
  end

  def show

  end


  private
  def load_user
    @user = current_user
  end

  def load_contacts
    @contacts = Contact.ordered_by("created_at DESC")
  end

  def load_contact
    @contact = Contact.find(params[:id]) if params[:id]
  end

  def button_condition
    @my_button = params[:action]
  end

end
