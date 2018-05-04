require 'spec_helper'
require 'rack/test'
require_relative '../app'

RSpec.describe 'hello app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET '/'" do
    it "loads index" do
      get '/'
      expect(last_response).to be_ok
    end

    it "hompage content" do
      get '/'
      expect(last_response.body).to include("Процентная ставка (%):")
    end
  end

  describe "POST '/calc'" do
    it "displays calculate template if params are > 0" do
      post '/calc', percent: '12', credit: '10000', term: '6'
      expect(last_response.body).to include("номер месяца")
    end
  end

end