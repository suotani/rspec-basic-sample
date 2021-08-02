require 'rails_helper'


RSpec.describe Todo, type: :model do

  describe "validations" do
    describe "#text" do
      it { is_expected.to validate_presence_of(:text) }
      it { is_expected.to validate_length_of(:text).is_at_most(20)}
    end
    
  end
end