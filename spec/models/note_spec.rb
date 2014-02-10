require 'spec_helper'

describe Note do
  describe "associations" do
    it { should belong_to :contact }
  end
end
