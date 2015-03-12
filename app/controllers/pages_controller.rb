class PagesController < ApplicationController
  def home
    @article = Article.all.order(created_at: :desc).first
    @event = Event.all.order(created_at: :desc).first
    @concept = Concept.all.order(created_at: :desc).first
    @opinion = Opinion.all.order(created_at: :desc).first
  end
end