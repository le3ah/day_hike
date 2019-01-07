require 'rails_helper'

RSpec.describe Watersource, type: :model do
  describe 'relationships' do
    it { should belong_to :trail }
  end
end
