class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,{only:[:edit, :update, :destroy]}
  def new
    @book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
    @newbook = Book.new
    @user = current_user
  end

  def index
    @book = Book.new
  	@books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
  end

  def create
  	@book = Book.new(book_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @book.user = current_user
  	if @book.save #入力されたデータをdbに保存する。
  		redirect_to @book, notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@books = Book.all
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end



  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to @book, notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def delete
  	@book = Book.find(params[:id])
  	@book.destoy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    if @book.user != current_user
    redirect_to books_path
    end
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
