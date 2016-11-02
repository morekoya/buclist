require 'rails_helper'

RSpec.describe Bucketlist, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user).dependent(:destroy) }
    it { is_expected.to have_many :items }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
  end

  describe "search" do
    let(:dream) { FactoryGirl.create(:bucketlist, name: "My life dreams") }
    
    context "when query is in bucketlist" do
      it "returns the list of bucketlists matching the query supplied" do
        expect(Bucketlist.search("dream")).to eq [dream]
      end
    end

    context "when query is not in bucketlist" do
      it "returns an empty array" do
        expect(Bucketlist.search("hope")).to eq []
      end
    end
  end
end
