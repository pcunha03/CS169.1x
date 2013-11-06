Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end


When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/,?\s+/).each do |rating|
    if uncheck == nil
      step("I check \"ratings_#{rating}\"") 
    else
      step("I uncheck \"ratings_#{rating}\"")
    end
  end
end

Then /I should (not )?see all movies with rating: (.*)/ do |notsee, rating_list|
  condition = rating_list.split(/,?\s+/)
  condition = Movie.all_ratings.delete_if { |x| condition.include?(x) } unless notsee == nil
  Movie.find_all_by_rating(condition).count.should == page.all('table tbody tr').count
end

Then /I should see all the movies/ do
  Movie.find(:all).count.should == page.all('table tbody tr').count
end