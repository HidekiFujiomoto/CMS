class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]


  def index
    @contacts = Contact.all.reverse_order
    @reception_msg = Contact.where(contact_user_name: current_user.user_name)
    @send_msg = Contact.where(user_name: current_user.user_name)
  end


  def show
  end

  # GET /contacts/new
  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
      @user = User.find(params[:user])
      @contact.contact_user_name = @user.user_name
      @contact.contact_user_email = @user.user_email
      @contact.user_name = current_user.user_name
    end
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    @contact.contact_img.retrieve_from_cache! params[:cache][:contact_img] if params[:cache][:contact_img].present?

    if @contact.save
      redirect_to contacts_path, notice:"メッセージを送信しました！"
      @user_email = @contact.contact_user_email
      CMSMailer.send_email(@user_email).deliver
    else
      render "new"
    end

  end

  def update
    @contact.user_id = current_user.id
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "メッセージを送信しました！"
    else
      render "new"
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice:"メッセージを削除しました！"
  end

  def confirm
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
  end


  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.fetch(:contact, {})
      params.require(:contact).permit(:user_id,:user_name, :contact_content,
        :contact_user_id,:contact_user_name,:contact_user_email,
        :contact_user_fbmsg,:contact_img,:contact_img_cache)
    end
end
