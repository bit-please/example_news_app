class Api::ArticlesController < ApplicationController

	def index
		search_term = params[:search]
		@articles = HTTP
			.headers({
				"X-Api-Key" => ENV["api_key"]
			})
			.get("https://newsapi.org/v2/everything?q=#{search_term}")
			.parse["articles"]
		render 'index.json.jbuilder'
	end

end
