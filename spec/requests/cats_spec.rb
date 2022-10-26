require 'rails_helper'

RSpec.describe "Cats", type: :request do
  
  describe "GET /index" do
    it "get the list of cats" do
      Cat.create(
        name: "Fluffy",
        age: 4,
        enjoys: "eating cat treats",
        image: ""
        )
        
        get '/cats'
        
        cat = JSON.parse(response.body)
        
        expect(response.status).to eq(200)
        expect(cat.length).to eq(1)
      end
      
    end 
    

  describe "POST /create" do
    it "creates a new cat entry" do
      cat_params = {
        cat: {
          name: "Fluffy",
          age: 4,
          enjoys: "eating cat treats",
          image: ""
        }
      }

      post "/cats", params: cat_params

      cat = Cat.first

      expect(cat.name).to eq("Fluffy")
      expect(cat.enjoys).to eq("eating cat treats")
    end
  end
     
end
