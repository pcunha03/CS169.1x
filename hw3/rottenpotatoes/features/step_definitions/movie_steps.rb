Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    if Movie.where(["title = ?", movie[:title]]).length == 0
      Movie.create!(movie)
    end
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  page.body.should =~ regexp
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  action_str = (uncheck == "un")? "uncheck" : "check"
  
  rating_list.gsub(/\s+/,"").split(',').each do |rating|
    step_str = %Q{When I #{action_str} "ratings_#{rating}"}
    steps step_str
  end
end

Then /I should( not)? see movies having ratings: (.*)/ do | have, rating_list|
  where_str =  "rating IN (?)"
  rating_values = rating_list.gsub(/\s+/,"").split(',')
  movie_list = Movie.where([where_str, rating_values])

  movie_list.each do |m|
    step_str = %Q{Then I should#{have} see "#{m.title}"}
    steps step_str
  end
end