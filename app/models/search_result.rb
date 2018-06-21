class SearchResult < ActiveRecord::Base
  extend Textacular
  belongs_to :searchable, polymorphic: true

  def initialize(args)
    @query = args[:query]
  end

  def results
    if @query.present?
      self.class.basic_search(@query).preload(:searchable).map(&:searchable).uniq
    else
      SearchResult.none
    end
  end

  def readonly?
    true
  end
end
