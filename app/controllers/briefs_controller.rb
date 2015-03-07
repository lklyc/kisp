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
      redirect_to root_path
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
      redirect_to root_path
    else
      render :edit
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

end