require "spec_helper"

describe ApplicationHelper do
  describe "#angular_scope" do
    let(:data) { { :first => "John", :last => "Doe" } }
    subject { helper.angular_scope(data) }

    it "generates <angular-scope></angular-scope> tag" do
      should match /<angular-scope.*?>.*?<\/angular-scope>/
    end

    it "generates tag that is hidden" do
      should match /ng-hide="true"/
    end

    it "generates tag that has JSON as its content" do
      json = CGI.escapeHTML(data.to_json)
      should match /#{json}/
    end
  end  
end