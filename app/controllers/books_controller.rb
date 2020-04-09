class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_book, only: [:edit]

  def top
    
  end

  def show
    @new_book = Book.new
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def index
  	@book = Book.new
    @books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
    @user = current_user
  end

  def create
  	@book = current_user.books.new(book_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
  	if @book.save #入力されたデータをdbに保存する。
  		redirect_to book_path(@book), notice: "successfully created book!"#保存された場合の移動先を指定。
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
  		redirect_to book_path(@book), notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def baria_book
    book = Book.find(params[:id])
    if book.user_id != current_user.id
      redirect_to books_path
    end
  end


end
