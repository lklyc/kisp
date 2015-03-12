class BriefsController < ApplicationController
  before_action :require_user

  def new
    @brief = Brief.new
    @briefable = identify_briefable(params[:type])
    @@type = @briefable
  end

  def create
    @brief = Brief.new(briefs_params)
    @brief.user = current_user
    @brief.briefable = @@type
    @@type = nil
    if @brief.save
      flash[:success] = 'Brief has been created'
      redirect_to identify_show_path(@brief.briefable_type, @brief.briefable)
    else
      render :new
    end
  end
  # need to fix edit and updates
  def edit
    @brief = Brief.find(params[:id])
    #@article = Article.find(params[:article_id])
  end

  def update
    @brief = Brief.find(params[:id])
    if @brief.update(briefs_params)
      flash[:success] = "Brief has been updated"
      redirect_to identify_show_path(@brief.briefable_type, @brief.briefable)
    else
      render :edit
    end
  end

  def vote
    
    @brief = Brief.find(params[:id])
    @vote = Vote.create(vote: 1)
    @vote.brief = @brief
    @vote.user = current_user

    if @vote.save
      flash[:success] = 'voted.'
      redirect_to :back
    else
      flash[:error] = 'error voting.'
      render :back
    end
  end 

  private

  def briefs_params
    params.require(:brief).permit(:body)
  end

  def identify_briefable(type)
    if type == 'Article'
      obj = Article.find(params[:id])
    elsif type == 'Event'
      obj = Event.find(params[:id]) 
    elsif type == 'Concept'
      obj = Concept.find(params[:id])
    elsif type == 'Opinion'
      obj = Opinion.find(params[:id])
    end

    return obj
  end

  def identify_show_path(type, obj)

    path = root_path

    if type == 'Article'
      path = article_path(obj)
    elsif type == 'Event'
      path = event_path(obj)
    elsif type == 'Concept'
      path = concept_path(obj)
    elsif type == 'Opinion'
      path = opinion_path(obj)
    end

    return path
  end

end