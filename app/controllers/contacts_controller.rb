class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.create(contact_params)
      redirect_to @contact
    end

    def index
      @contacts = Contact.all
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def update
      @contact = Contact.find(params[:id])
      @contact.update(contact_params)
      redirect_to @contact
    end

    def show
      @contact = Contact.find(params[:id])
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to :users
    end

    private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :title, :phone, :ext)
    end
  end
