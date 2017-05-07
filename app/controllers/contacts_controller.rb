class ContactsController < ApplicationController
    def index
      @contacts = Contact.all
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def update
      @contact = Contact.find(params[:id])
      redirect_to @contact
    end

    def show
      @contact = Contact.find(params[:id])
    end
  end
