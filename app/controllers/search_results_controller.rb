class SearchResultsController < ApplicationController
  def index
    @results = SearchResult.new(query: params[:search_term]).results
  end
end