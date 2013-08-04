require 'spec_helper'

describe "URL Rewriting" do
  it "rewrites old requests to the new subdomain" do
    get 'https://training.gaslightsoftware.com/post/12345'
    response.response_code.should == 301
    response.location.should match('http://training.gaslight.co')
  end

  it "allows direct requests" do
    get 'http://training.gaslight.co/'
    response.response_code.should == 200
  end
end

