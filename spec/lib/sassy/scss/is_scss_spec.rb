require 'spec_helper'

class TestClass
  include Sassy::SCSS::IsSCSS

  def to_scss
    "c: d;"
  end
end

describe TestClass do
  describe "instance methods" do
    before { @tc = TestClass.new }

    describe "#<=>" do
      it "compares the to_scss" do
        other = mock(TestClass, :to_scss => "a: b;")
        @tc.stub!(:to_scss => @tc.to_scss)
        @tc.to_scss.should_receive(:<=>).with(other.to_scss)
        @tc <=> other
      end
    end

    describe "#eql?" do
      it "compares the to_scss" do
        other = mock(TestClass, :to_scss => "a: b;")
        @tc.stub!(:to_scss => @tc.to_scss)
        @tc.to_scss.should_receive(:eql?).with(other.to_scss)
        @tc.eql?(other)
      end
    end

    describe "#hash" do
      it "returns the scss hash" do
        @tc.hash.should == @tc.to_scss.hash
      end
    end
  end
end