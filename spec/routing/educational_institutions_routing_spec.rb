require "rails_helper"

RSpec.describe EducationalInstitutionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/educational_institutions").to route_to("educational_institutions#index")
    end

    it "routes to #show" do
      expect(:get => "/educational_institutions/1").to route_to("educational_institutions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/educational_institutions").to route_to("educational_institutions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/educational_institutions/1").to route_to("educational_institutions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/educational_institutions/1").to route_to("educational_institutions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/educational_institutions/1").to route_to("educational_institutions#destroy", :id => "1")
    end
  end
end
