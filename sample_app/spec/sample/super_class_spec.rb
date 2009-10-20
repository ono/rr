require File.dirname(__FILE__) + '/../spec_helper'

class Foo
  def self.hello
    "hello"
  end
end

class FooBar < Foo
  def self.konnichiwa
    "konnichiwa"
  end
end

describe '#mock' do
  it "should be able to mock a class method" do
    mock(Foo).hello { "hello!" }
    Foo.hello.should == "hello!"
  end
  
  it "should be able to mock a class method which will be executed by the subclass" do
    mock(Foo).hello { "hello!" }
    FooBar.hello.should == "hello!"
  end
  
  it "should not affect from a previous example" do
    FooBar.hello.should == "hello"
  end
end
