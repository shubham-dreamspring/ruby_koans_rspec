require 'spec_helper'

describe "Inheritance" do
  class Inhertance_Spec
  
  class Dog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      "WOOF"
    end
  end

  class Chihuahua < Dog
    def wag
      :happy
    end

    def bark
      "yip"
    end
  end
end
  it "should demonstrate subclasses_have_the_parent_as_an_ancestor" do
    Inhertance_Spec::Chihuahua.ancestors.include?(Inhertance_Spec::Dog).should eql true
  end

  it "should demonstrate all_classes_ultimately_inherit_from_object" do
    Inhertance_Spec::Chihuahua.ancestors.include?(Object).should eql true
  end

  it "should demonstrate subclasses_inherit_behavior_from_parent_class" do
    chico = Inhertance_Spec::Chihuahua.new("Chico")
    chico.name.should eql "Chico"
  end

  it "should demonstrate subclasses_add_new_behavior" do
    chico = Inhertance_Spec::Chihuahua.new("Chico")
    chico.wag.should eql :happy

    expect{
      fido =Inhertance_Spec::Dog.new("Fido")
      fido.wag
    }.to raise_error(NoMethodError)

  end

  it "should demonstrate subclasses_can_modify_existing_behavior" do
    chico = Inhertance_Spec::Chihuahua.new("Chico")
    chico.bark.should eql "yip"

    fido = Inhertance_Spec::Dog.new("Fido")
    fido.bark.should eql "WOOF"
  end

  # ------------------------------------------------------------------

  class BullDog < Inhertance_Spec::Dog
    def bark
      super + ", GROWL"
    end
  end

  it "should demonstrate subclasses_can_invoke_parent_behavior_via_super" do
    ralph = BullDog.new("Ralph")
    ralph.bark.should eql "WOOF, GROWL"
  end

  # ------------------------------------------------------------------

  class GreatDane < Inhertance_Spec::Dog
    def growl
      super.bark + ", GROWL"
    end
  end

  it "should demonstrate super_does_not_work_cross_method" do
    george = GreatDane.new("George")
    expect{george.growl}.to raise_error(NoMethodError)
  end

end