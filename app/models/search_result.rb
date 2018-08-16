# == Schema Information
#
# Table name: search_results
#
#  searchable_id   :bigint(8)
#  searchable_type :text
#  search_term     :string
#

class SearchResult < ActiveRecord::Base
  extend Textacular
  FILTERABLE= [
    "all", "item", "category", 
    "order", "message", "item message", 
    "brand", "user"
  ].freeze
  belongs_to :searchable, polymorphic: true

  def initialize(args)
    @query = query_param(args[:query])
    @filter = filter_param(args[:filter_by])
    @sort = sort_param(args[:sort_by])
  end

  def results
    case 
    when @query.present? && @filter.present?
      self.class.where('lower(searchable_type) = ?', @filter).
        advanced_search(@query).preload(:searchable).map(&:searchable).uniq.sort { |a, b| (a.created_at <=> b.created_at) == @sort ? -1 : 1 }
    when @query.present?
      self.class.advanced_search(@query).preload(:searchable).map(&:searchable).uniq.sort { |a, b| (a.created_at <=> b.created_at) == @sort ? -1 : 1 }
    else
      SearchResult.none
    end
  end

  def readonly?
    true
  end

  private

  def query_param(query)
    case query
    when /\+/
      query.split('+').map(&:strip).join('|')
    when /[!&|]/
      query.gsub(/[!&|]/, '')
    else
      query.strip
    end
  end

  def filter_param(filter_by)
    case filter_by
    when "all"
      nil
    when "items"
      "product"
    when proc { |n| FILTERABLE.include?(n) }
      filter_by.gsub(' ', '').downcase
    else
      nil
    end
  end

  def sort_param(sort)
    return 1 unless sort.present?
    sort == "most_recent" ? 1 : -1
  end
end
