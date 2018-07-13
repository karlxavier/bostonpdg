class SearchResultsController < ApplicationController
  def index
    @results = SearchResult.
      new(query: params[:search_term]).results.
      group_by { |result| result.class.name }
  end
end