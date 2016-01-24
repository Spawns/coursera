class Coursera
  include HTTParty

  base_uri 'https://api.coursera.org/api/catalog.v1/courses'
  default_params fields: "smallIcon,shortDescription", q: "search"
  format :json

  def self.for term
    get("", query:{query: term})["elements"]
  end
end

require 'httparty'

class Recipe
  include HTTParty

  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end
