require 'rails_helper'

RSpec.describe "Cats", type: :request do
  
  describe "GET /index" do
    it "get the list of cats" do
      Cat.create(
        name: "Fluffy",
        age: 4,
        enjoys: "eating cat treats",
        image: "comhttp/cat."
        
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
          image: "comhttp/cat."
        }
      }

      post "/cats", params: cat_params

      cat = Cat.first

      p cat

      expect(cat.name).to eq("Fluffy")
      expect(cat.enjoys).to eq("eating cat treats")
    end
  end

  describe "cannot create a cat without valid attributes" do
  it "cannot create a cat without a name" do
    cat_params = {
      cat: {
        age: 4,
        enjoys: "eating cat treats",
        image: "comhttp/cat."
      }
    }

    post '/cats', params: cat_params

    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end
end
     
end
