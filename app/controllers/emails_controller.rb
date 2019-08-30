class EmailsController < ApplicationController

  def index
    @email = Email.all
  end
  
  def create
    @email = Email.create(object: Faker::Internet.email, body: Faker::Music.album, read: false)
     respond_to do |format|
        format.html {redirect_to emails_path}   
        format.js { } 
    end
  end



  def show
    @email = Email.find(params[:id])
    respond_to do |format|
        format.html {redirect_to emails_path}   
        format.js { } 
    end  
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
        format.html {redirect_to emails_path}   
        format.js { } 
    end  
  end

  def update
    
    @email = Email.find(params[:id])
    if @email.read ==  false
        @email.read= true
        @email.save
    else
      @email.read = false
      @email.save
    end
    
    respond_to do |format|
        format.html {redirect_to emails_path}   
        format.js { } 
    end 
    
    
  end

end
