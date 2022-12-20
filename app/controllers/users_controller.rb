class UsersController < ApplicationController
    #GET /users [Get all users]
    def index
        @users = User.all
        render json: @users
    end

    #GET /users/:id [Get a specific user by their ID]
    def show
        @user = User.find(params[:id])
        render json: @user
    end
    #POST /users [Create a user] 
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render error: {error: "Error in creating user"}, status: 400
        end
    end
    #PUT /users/:id [Update a user]
    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: {message: "User successfully updated"}, status: 200
        else
            render error: {error: "Error in updating user"}, status: 400
        end
    end
    #DELETE /users/:id [Delete a user]
    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json: {message: "User successfully deleted"}, status: 200
        else
            render error: {error: "Error in deleting user"}, status: 400
        end
    end

    private
    def user_params
        params.require(:user).permit(:firstName, :lastName, :email, :password)
    end
end
