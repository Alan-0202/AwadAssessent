# spec/models/fictions_spec.rb

require 'rails_helper'

RSpec.describe Fiction, :type => :model do

  subject {
    described_class.new(id: nil,
                        name: "ALan",
                        author: "alan",
                        reviews: 7000,
                        price: 26,
                        year: nil,
                        created_at: DateTime.now,
                        updated_at: DateTime.now + 1.week,
)
  }




  it "is valid with valid attributes" do

    expect(subject).to be_valid
  end


  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a author" do
    subject.author = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a reviews" do
    subject.reviews = nil
    expect(subject).to_not be_valid

  end
  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end
end
