require 'spec_helper'

describe Sassy::SCSS::RuleSet do

  describe ".new" do
    it "returns an instance of Sassy::SCSS::RuleSet" do
      Sassy::SCSS::RuleSet.new.should be_an_instance_of(Sassy::SCSS::RuleSet)
    end

    context "given a block" do
      it "calls instance_eval" do
        Sassy::SCSS::RuleSet.new do
          self.class.should == Sassy::SCSS::RuleSet
        end
      end
    end
  end

  describe "instance methods" do
    before { @rs = Sassy::SCSS::RuleSet.new }

    describe "#add" do
      context "with a non-rule" do
        before { @selector = "body" }

        it "creates a rule" do
          Sassy::SCSS::Rule.should_receive(:new).with(@selector)
          @rs.add(@selector)
        end

        it "adds the rule to the set" do
          rule = Sassy::SCSS::Rule.new(@selector)
          Sassy::SCSS::Rule.stub!(:new => rule)
          @rs.add(rule)
          @rs.send(:set).should be_include(rule)
        end
      end

      context "with a rule" do
        it "adds the rule to the set" do
          rule = Sassy::SCSS::Rule.new(".header")
          @rs.add(rule)
          @rs.send(:set).should be_include(rule)
        end
      end
    end
  end

end