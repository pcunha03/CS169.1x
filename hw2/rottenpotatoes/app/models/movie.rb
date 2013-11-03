class Movie < ActiveRecord::Base
  def self.all_ratings
    a = {}
  	a = Movie.select(:rating).map(&:rating).uniq
  	hash = Hash[a.map {|x| [x, x]}] 
 end

  def self.filter(filtro, sort_by='')
    find_params = Hash.new
    find_params[:order] = sort_by
    find_params[:conditions] = ["rating IN (?)", filtro]
    @movies = Movie.find(:all, find_params)
  end
end
