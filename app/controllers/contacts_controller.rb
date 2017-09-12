class ContactsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        flash[:notice] = "contact created"
        redirect_to @contact
      else
        @errors = @contact.errors.messages
        flash[:notice] = @errors
        render :new
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
        flash[:notice] = "contact updated"
        redirect_to @contact
      else
        @errors = @contact.errors.messages
        flash[:notice] = @errors
        render :edit
      end
    end

    def show
      @contact = Contact.find(params[:id])
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      flash[:notice] = "Contact deleted"
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
