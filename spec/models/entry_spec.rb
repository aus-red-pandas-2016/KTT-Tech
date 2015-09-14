require 'spec_helper'

describe Entry do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end
end
