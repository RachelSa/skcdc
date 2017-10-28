class ContactsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        flash[:notice] = "Success! Visit <a href='#{contacts_path}'>updated contact page</a>."
        redirect_to @contact
      else
        @errors = @contact.errors.messages
        flash[:notice] = @errors
        render :new
      end
    end

    def index
      @contacts = Contact.all.order(:first_name)
      @recent_posts = Post.all.order('id DESC').limit(3)
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def update
      @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
        flash[:notice] = "Success! Visit <a href='#{contacts_path}'>updated contact page</a>."
        redirect_to @contact
      else
        @errors = @contact.errors.messages
        flash[:notice] = @errors
        render :edit
      end
    end

    def show
      @contact = Contact.find_by(id: params[:id])
      if !@contact
        redirect_to contacts_path
      end
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
