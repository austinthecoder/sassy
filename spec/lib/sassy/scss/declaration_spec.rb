require 'spec_helper'

describe Sassy::SCSS::Declaration do

  describe ".new" do
    [
      [],
      [nil],
      [nil, nil],
      ['property'],
      ['property', nil],
      [nil, 'value'],
      [nil, nil]
    ].each do |args|
      context "when the args are #{args.inspect}" do
        before { @args = args }

        it "raise an error" do
          lambda { Sassy::SCSS::Declaration.new(*@args) }.should raise_error(ArgumentError)
        end
      end
    end

    [
      ['property', 'value']
    ].each do |args|
      context "when the args are #{args.inspect}" do
        before { @args = args }

        it "returns an instance of Sassy::SCSS::Declaration" do
          Sassy::SCSS::Declaration.new(*@args).should be_an_instance_of(Sassy::SCSS::Declaration)
        end
      end
    end
  end

  describe "#to_scss" do
    context "when the property is 'color' and the value is 'red'" do
      before { @d = Sassy::SCSS::Declaration.new('color', 'red') }

      it("returns 'color: red;'") { @d.to_scss.should == 'color: red;' }
    end
  end

end