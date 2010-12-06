require 'spec_helper'

describe Sassy::SCSS::Rule do

  describe ".new" do
    [[], [nil]].each do |args|
      context "when the args are #{args.inspect}" do
        before { @args = args }

        it "raises an ArgumentError" do
          lambda { Sassy::SCSS::Rule.new(*@args) }.should raise_error(ArgumentError)
        end
      end
    end

    [[".header"]].each do |args|
      context "when the args are #{args.inspect}" do
        before { @args = args }

        it "returns an instance of Sassy::SCSS::Rule" do
          Sassy::SCSS::Rule.new(@args).should be_an_instance_of(Sassy::SCSS::Rule)
        end
      end
    end
  end

  describe "instance methods" do
    before { @r = Sassy::SCSS::Rule.new('body') }

    describe "#declarations" do
      context "when hasn't been called before" do
        it "returns a DeclarationSet" do
          @r.declarations.should be_an_instance_of(Sassy::SCSS::DeclarationSet)
        end

        it("the returned set is empty") { @r.declarations.should be_empty }
      end

      context "after being called once" do
        before { @ds = @r.declarations }

        it("returns the same Set") { @r.declarations.should equal(@ds) }
      end
    end

    describe "#rules" do
      context "when hasn't been called before" do
        it("returns a RuleSet") { @r.rules.should be_an_instance_of(Sassy::SCSS::RuleSet) }

        it("the returned set is empty") { @r.rules.should be_empty }
      end

      context "after being called once" do
        before { @rs = @r.rules }

        it("returns the same Set") { @r.rules.should equal(@rs) }
      end
    end

    describe "#to_scss" do
      it "returns scss" do
        @r.to_scss.should == "body { }"
      end

      context "after adding a rule" do
        before { @r.rules.add(".header") }

        it "return scss" do
          @r.to_scss.should == "body { .header { } }"
        end
      end

      context "after adding a declaration" do
        before { @r.declarations.add("color", "green") }

        it "returns scss" do
          @r.to_scss.should == "body { color: green; }"
        end

        context "after adding a rule" do
          before { @r.rules.add(".header") }

          it "return scss" do
            @r.to_scss.should == "body { color: green; .header { } }"
          end
        end

        context "after adding another declaration" do
          before { @r.declarations.add("font-weight", "bold") }

          it "returns scss" do
            @r.to_scss.should == "body { color: green; font-weight: bold; }"
          end
        end

        context "after adding the same declaration" do
          before { @r.declarations.add("color", "green") }

          it "returns scss" do
            @r.to_scss.should == "body { color: green; }"
          end
        end
      end
    end
  end

end