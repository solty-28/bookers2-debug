class SearchController < ApplicationController
	before_action :authenticate_user!

	def index
		@book = Book.new
		method = params[:search_method]
		word = params[:search_word]
		if params[:search_model] == "1"
			@search = User.search(method,word)
		else params[:search_model] == "2"
			@search = Book.search(method,word)
        end
	end
end
