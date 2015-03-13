class PagesController < ApplicationController
  def home
    @article = Brief.where(briefable_type: 'Article').sort_by{|x| x.total_votes}.reverse.first.briefable
    @event = Brief.where(briefable_type: 'Event').sort_by{|x| x.total_votes}.reverse.first.briefable
    @concept = Brief.where(briefable_type: 'Concept').sort_by{|x| x.total_votes}.reverse.first.briefable
    @opinion = Brief.where(briefable_type: 'Opinion').sort_by{|x| x.total_votes}.reverse.first.briefable
    #@article = Article.all.order(created_at: :desc).first
    # @event = Event.all.order(created_at: :desc).first
    # @concept = Concept.all.order(created_at: :desc).first
    # @opinion = Opinion.all.order(created_at: :desc).first
  end
end