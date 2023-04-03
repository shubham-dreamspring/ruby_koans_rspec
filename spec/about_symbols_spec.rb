require 'spec_helper'

describe "Symbols" do

  it "should demonstrate symbols_are_symbols" do
    symbol = :ruby
    symbol.is_a?(Symbol).should eql true
  end

  it "should demonstrate symbols_can_be_compared" do
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else

    (symbol1 == symbol2).should eql true
    (symbol1 == symbol3).should eql false
  end

  it "should demonstrate identical_symbols_are_a_single_internal_object" do
    symbol1 = :a_symbol
    symbol2 = :a_symbol

    (symbol1 == symbol2).should eql true
    (symbol1.object_id == symbol2.object_id).should eql true
  end

  it "should demonstrate method_names_become_symbols" do
    symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    symbols_as_strings.include?("test_method_names_become_symbols").should eql false
  end

  # THINK ABOUT IT:
  #
  # Why do we convert the list of symbols to strings and then compare
  # against the string value rather than against symbols?

  RubyConstant = "What is the sound of one hand clapping?"

  it "should demonstrate constants_become_symbols" do
    all_symbols = Symbol.all_symbols

    all_symbols.include?("What is the sound of one hand clapping?").should eql false
  end

  it "should demonstrate symbols_can_be_made_from_strings" do
    string = "catsAndDogs"
    string.to_sym.should eql :catsAndDogs
  end

  it "should demonstrate symbols_with_spaces_can_be_built" do
    symbol = :"cats and dogs"

    symbol.should eql "cats and dogs".to_sym
  end

  it "should demonstrate symbols_with_interpolation_can_be_built" do
    value = "and"
    symbol = :"cats #{value} dogs"

    symbol.should eql "cats and dogs".to_sym
  end

  it "should demonstrate to_s_is_called_on_interpolated_symbols" do
    symbol = :cats
    string = "It is raining #{symbol} and dogs."

    string.should eql "It is raining #{symbol} and dogs."
  end

  it "should demonstrate symbols_are_not_strings" do
    symbol = :ruby
    symbol.is_a?(String).should eql false
    symbol.eql?("ruby").should eql false
  end

  it "should demonstrate symbols_do_not_have_string_methods" do
    symbol = :not_a_string
    symbol.respond_to?(:each_char).should eql false
    symbol.respond_to?(:reverse).should eql false
  end

  # It's important to realize that symbols are not "immutable
  # strings", though they are immutable. None of the
  # interesting string operations are available on symbols.

  it "should demonstrate symbols_cannot_be_concatenated" do
    # Exceptions will be pondered further down the path
    expect{:cats + :dogs}.to raise_error(NoMethodError)
  end

  it "should demonstrate symbols_can_be_dynamically_created" do
    ("cats" + "dogs").to_sym.should eql :catsdogs
  end

  # THINK ABOUT IT:
  #
  # Why is it not a good idea to dynamically create a lot of symbols?
end