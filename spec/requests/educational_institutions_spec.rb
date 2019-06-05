require 'rails_helper'

RSpec.describe "EducationalInstitutions", type: :request do
  describe "GET /educational_institutions" do
    it "works! (now write some real specs)" do
      get educational_institutions_path
      expect(response).to have_http_status(200)
    end
  end
end
