class OrderSearchService
  def initialize(query:, filter_by: 'order', sort_column:, sort_direction: 'asc')
    @query = query
    @filter_by = filter_by
    @sort_column = sort_column
    @sort_direction = sort_direction
  end

  def self.call(args)
    self.new(args).results
  end

  def results
    if @query.present?
      data = SearchResult.new(search_params).results
      sort_results(data.blank? ? Order.all : data)
    else
      sort_results(Order.all)
    end
  end

  private

  attr_reader :query, :filter_by, :sort_column, :sort_direction

  def search_params
    { 
      query: query, 
      filter_by: filter_by,
    }
  end

  def sort_results(data)
    data = data.is_a?(Array) ? Order.where(id: data.map(&:id)) : data
    data.joins(:brand).order("#{sort_column} #{sort_direction}")
  end
end