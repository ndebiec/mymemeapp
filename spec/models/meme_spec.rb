require 'rails_helper'

RSpec.describe Meme, type: :model do

  it "is not valid without a picture" do
    meme = Meme.new(picture: nil)
    expect(meme).to_not be_valid
  end  

  describe "Associations" do
    it { should belong_to(:user) }
  end
end