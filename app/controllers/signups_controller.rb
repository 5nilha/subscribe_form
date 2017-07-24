class SignupsController < ApplicationController
  
  def new 
    @signup = Signup.new
  end
  
  def create 
    #Use signup_params to safely collect data from the form and update the database. 
    @signup = Signup.new(signup_params)
    # After saving to the database, redirect to thanks_url
    if @signup.save 
      redirect_to '/thanks' #redirect to URL not to the controller
    else
      render 'new'
    end
  end
  
  private 
  def signup_params 
    #Here we require the model name signup and permit the column name email.
    params.require(:signup).permit(:name, :email) 
  end
  
end
