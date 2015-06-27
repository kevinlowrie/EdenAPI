require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe "GET /images" do
    it "should list all images" do
      FactoryGirl.create(:image)
      FactoryGirl.create(:image)
      get 'index'
      expect_status(200)
      expect_json_sizes(2)
    end
  end

  describe "POST /images" do
    it "should return an error if params are not valids" do
      params = {
          repo: nil,
          name: nil
      }

      post 'create', image: params
      expect_status(500)
    end

    it "should return an image if params are valids" do
      params = {
          repo: "dernise/mincraft",
          name: "Minecraft"
      }

      post 'create', image: params
      expect_status(200)
    end
  end

  describe "PUT /images/:id" do
    it "should return a 500 error if it can't find the object" do
    end

    it "should update the image if params are valids" do
    end
  end

  describe "DELETE /images/:id" do
    it "should return 500 if it can't find an image" do
      delete 'destroy', id: 69
      expect_status(500)
    end

    it "should destroy the image if found" do
      image = FactoryGirl.create(:image)
      delete 'destroy', id: image.id
      expect_status(200)
    end
  end
end
