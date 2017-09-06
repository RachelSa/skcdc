class ContactsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        redirect_to @contact
      else
        redirect_to new_contact_path, :notice => "Contacts must have a first and last name"
      end
    end

    def index
      @contacts = Contact.all
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def update
      @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
        redirect_to @contact
      else
        redirect_to edit_contact_path, :notice => "Contacts must have a first and last name"
      end
    end

    def show
      @contact = Contact.find(params[:id])
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to admin_path
    end

    def admin
      @contact_names = Contact.all.pluck(:first_name, :last_name, :title, :id)
    end

    private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :title, :phone, :ext)
    end
  end
