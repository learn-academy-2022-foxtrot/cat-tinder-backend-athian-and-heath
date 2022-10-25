require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name exists in the db entry" do
    cat = Cat.create(age:2, enjoys:"hugs", image: "hht://catpic.com")
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age exists in the db entry" do
    cat = Cat.create(name:"DogCat", enjoys:"hugs", image: "hht://catpic.com")
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys exists in the db entry" do
    cat = Cat.create(name:"DogCat", age:2, image: "hht://catpic.com")
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate image exists in the db entry" do
    cat = Cat.create(name:"DogCat", age:2, enjoys:"hugs")
    expect(cat.errors[:image]).to_not be_empty
  end
   
  it "should validate enjoys is at least 10 characters long" do
    cat = Cat.create(name:"DogCat", age:2, enjoys:"hugs", image:"hht://catpic.com")
    expect(cat.errors[:enjoys]).to_not be_empty
  end


end
