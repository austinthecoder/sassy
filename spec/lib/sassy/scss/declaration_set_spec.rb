require 'spec_helper'

describe Sassy::SCSS::DeclarationSet do

  describe ".new" do
    it "returns an instance of Sassy::SCSS::DeclarationSet" do
      Sassy::SCSS::DeclarationSet.new.should be_an_instance_of(Sassy::SCSS::DeclarationSet)
    end
  end

  describe "instance methods" do
    before { @ds = Sassy::SCSS::DeclarationSet.new }

    describe "#add" do
      it "creates a declaration with the args" do
        args = ["background", "green"]
        Sassy::SCSS::Declaration.should_receive(:new).with(*args)
        @ds.add(*args)
      end

      it "adds the declaration to the set" do
        declaration = mock(Sassy::SCSS::Declaration)
        Sassy::SCSS::Declaration.stub!(:new => declaration)
        @ds.add
        @ds.send(:set).should be_include(declaration)
      end
    end
  end

end