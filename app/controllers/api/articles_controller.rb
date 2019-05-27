class Api::ArticlesController < ApplicationController

	def index
		search_term = params[:search]
		@articles = HTTP.get("https://newsapi.org/v2/everything?q=#{search_term}&apiKey=eda1b96b200f466b8bce1df354d74871").parse["articles"]
		render 'index.json.jbuilder'
	end

end
