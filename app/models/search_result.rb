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
  belongs_to :searchable, polymorphic: true

  def initialize(args)
    @query = case args[:query]
    when /\+/
      args[:query].split('+').map(&:strip).join('|')
    else
      args[:query].strip
    end
  end

  def results
    if @query.present?
      self.class.advanced_search(@query).preload(:searchable).map(&:searchable).uniq
    else
      SearchResult.none
    end
  end

  def readonly?
    true
  end
end
