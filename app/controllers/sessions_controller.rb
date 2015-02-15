class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
          session[:user_id] = user.id                           #stores the id in the session
          flash[:success] = "Welcome back " +user.first_name + "!" 

          if session[:return_to]
              return_to_path = session[:return_to]
              session[:return_to] = nil                            #destroys the session to avoid unexpected behavior on reconnection
              redirect_to return_to_path
          else
              redirect_to user
          end
      else
          flash[:error] = "Invalid name/password combination."
          render 'new'		          		                      #shows the signin page again
      end
  end

  def destroy
      if signed_in?
          session[:user_id]=nil
      else
          flash[:notice]="You need to sign in first"
      end
      redirect_to root_path
  end
end
