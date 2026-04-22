class UsersController < ApplicationController
  def index
    @book_new = Book.new
    @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "You have updated user sucessfully."
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
