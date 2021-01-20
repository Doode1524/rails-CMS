class Api < ApplicationRecord
    require 'net/http'
    require 'open-uri'
    require 'json'

    # def self.base_url
    #  "http://api.mediastack.com/v1"
    # end

    # def self.load_data
    #     news_data
    # end
    def self.load_data

        uri = URI("http://api.mediastack.com/v1/news?access_key=5b56e94b2e2f9d2a796e4a32261030ff&languages=en&limit=100")
        
        response = Net::HTTP.get_response(uri)
        data = JSON.parse(response.body)
        
        data["data"].each do |d|
            Article.create(d)
        end
        
    end
    
end








    # def self.news_data
    #     # uri = URI.parse(URL)
    #     response = Net::HTTP.get(URL)
    #     data = JSON.parse(response.body)
    #     # key_data = data.transform_keys(&:to_sym)
    #     # data.each do |d|
    #     #     key_data = d.transform_keys(&:to_sym)
    #     byebug
    #         Article.create(data)
    # end

# class GetPrograms

#     URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
  
#     def get_programs
#       uri = URI.parse(URL)
#       response = Net::HTTP.get_response(uri)
#       response.body
#     end
  
#   end