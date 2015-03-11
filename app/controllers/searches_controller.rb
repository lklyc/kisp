class SearchesController < ApplicationController
  def create
    @type = params[:type]
    @query = params[:query]

    search_term = '%' + @query + '%'

    if @type == 'Articles'
      @results = Article.where('display LIKE ?', search_term)
    elsif @type == 'Events'
      @results = Event.where('display LIKE ?', search_term)
    elsif @type == 'Concepts'
      @results = Concept.where('display LIKE ?', search_term)
    elsif @type == 'Opinions'
      @results = Opinion.where('display LIKE ?', search_term)
    end

    render :index
  end

  private 

end