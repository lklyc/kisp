class SearchesController < ApplicationController
  def create
    @type = params[:type]
    @query = params[:query]

    search_term = '%' + @query + '%'

    @articles = Article.where('display LIKE ?', search_term)
    @events = Event.where('display LIKE ?', search_term)
    @concepts = Concept.where('display LIKE ?', search_term)
    @opinions = Opinion.where('display LIKE ?', search_term)

    @@articles = @articles
    @@events = @events
    @@concepts = @concepts
    @@opinions = @opinions
    @@query = @query


    # if @type == 'Articles'
    #   @results = Article.where('display LIKE ?', search_term)
    # elsif @type == 'Events'
    #   @results = Event.where('display LIKE ?', search_term)
    # elsif @type == 'Concepts'
    #   @results = Concept.where('display LIKE ?', search_term)
    # elsif @type == 'Opinions'
    #   @results = Opinion.where('display LIKE ?', search_term)
    # end

    render :index
  end

  def index
    @articles = @@articles
    @events = @@events
    @concepts = @@concepts
    @opinions = @@opinions
    @query = @@query
  end
  

end