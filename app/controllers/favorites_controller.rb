class FavoritesController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@favorite = current_user.favorites.new(book_id: @book.id)
		@favorite.save
	end

	def destroy
		@book = Book.find(params[:book_id])
		@favorite = Favorite.find_by(book_id: @book.id, user_id: current_user.id).destroy
	end

end
