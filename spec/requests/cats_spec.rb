require 'rails_helper'

RSpec.describe "Cats", type: :request do
  
  describe "GET /index" do
    it "get the list of cats" do
      Cat.create(
        name: "Fluffy",
        age: 4,
        enjoys: "eating cat treats",
        image: "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80"
        
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
          image: "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80"
        }
      }

      post "/cats", params: cat_params

      expect(response).to have_http_status(200)

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
    #sends request to the server
    post '/cats', params: cat_params

    expect(response.status).to eq 422

    # convert json response into ruby hash
    cat = json = JSON.parse(response.body)

    expect(json['name']).to include "can't be blank"
    expect
  end
end
     
end
