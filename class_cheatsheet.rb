=begin
Classes
——————————————————————————————————————————————————
classes have data and methods
data: in order to give a class data, we have to set an instance variable within a method


we have this thing called self.
——————————————————————————————————————————————————
self inside a method refers to the instance of a class.
running self in irb will show you the instance of the class

class methods don't act on an instance. it acts on the whole class as a concept/collection
this code:

def report #=> instance method
end

def self.about_history #=> class method, refers to the class as a whole
end

--------------------------------------------------


@@ClassVariables
——————————————————————————————————————————————————
You can use class variables by prefixing "@@" in front of your variable name
use of class name : https://github.com/fishermanswharff/wdi_1_ruby_hw_mbta_simplified/blob/master/TRouter.rb

--------------------------------------------------


Modules
——————————————————————————————————————————————————
Modules are like classes, but more accessible. Classes create objects. modules give those objects more functionality
To give a class some functionality that you can repurpose, you can put that functionality into a module.
You 'mixin' a module. They're extra functionality that you can mixin wherever you want.
Modules are VERY useful for namespacing. You namespace everything within a module.
typically you take the name of your app:

NameOfApp::Class.method

recipe:

module Flyable

  def some_method
  end

  def fly
  end

  def hatch
  end

end

class Bird

  include Flyable

end

For Namespacing:

module NameOfGame
  class Character
    #some code goes here

    def create
    end
  end
end

NameOfGame::Character.create

=end




# Recipe for making a class
class ClassName #=> CamelCase name for ruby classes

  # creates getters and setters for the instance variables.
  # I think it's important to note here that you cannot access
  # the instance variable without a getter, and you can't set
  # them without a setter.
  # -------------------------------------------------------------
  # Only need these if you need to set these variables from
  # outside the class definition (ie on an instance of the class)
  # -------------------------------------------------------------
  attr_accessor :instance_variable, :name, :options, :new_option
  # You can control what you want to be available to get or set with:
  # attr_reader => available to read (only gets)
  # attr_writer => available to write (only sets) "pretty much useless" -David Fisher
  # attr_accessor => available to read and write (gets and sets)

  # methods: instance methods
  def initialize(argument="optional", options={}, name="Name") #=> literal syntax for setting optional parameters. for required params: def initialize(argument)

    @instance_variable = argument #=> instance variable. what if you want to set or get this instance variable?
    @options = options
    @name = name

    @new_option = "new option" #=> you don't have to pass in arguments to make instance variables, but...you have to have accessors in order to set those instance variables from outside the class definition

    # instance variables are available to "instances" of your class.
    # there are class methods and variables that are available to the class itself, but more on those later...

  end

  #this is getter method, it gets the instance variable and doesn't do anything else.
  def getter
    @instance_variable
  end

  # this is a setter method, it sets the instance variable to whatever you pass in as arguments.
  def setter=(parameter)
    @instance_variable = argument
  end

end

# if you're referring an instance method on it's own, looks like new_class#initialize

class NewClass < ClassName #=> NewClass inherits from ClassName
  attr_accessor :argument, :parameter, :new_variable

  def initialize(parameter) #=> having a method of the same name that is in the super class, overrides the parent class' method of the same name. Our parent class takes in 3 optional parameters, but our child class takes no parameters.
    super #=> everything is inherited from the parent class, unless it's overridden in the child class
    # what is you want this class to take a new parameter that the super class doesn't take?
    @parameter = parameter
  end

  def set_all_variables(instance_variable, argument, options, name, parameter)
    @instance_variable = instance_variable
    @options = options
    @name = name
    @parameter = parameter
    @argument = argument

    @new_variable = []
  end

end

# instantiate a new instance of ClassName
new_class = ClassName.new "not-optional" #=> in this case, the parameter is optional, because we assign a default value in initialize
another_class = ClassName.new "another option"
new_class.instance_variable #=> getter for instance variable "instance_variable"
another_class.name #=> getter for the instance variable "name"
another_new_class = NewClass.new("parameter")
another_new_class.name #=> inherits the default value from the super's initialize method returning "Name"

# yet_another_new_class = NewClass.new("not-optional",{name: "Baby Class"}, "Bartholomew") #=> returns an error, wrong number of arguments, 3 for 0
yet_another_new_class = NewClass.new("parameter")
yet_another_new_class.options = "a new instance variable" #=>setting the options parameters of the inherited option parameter from the parent class

yet_another_new_class.set_all_variables("instance_variable","string", {name: "whatever"}, "WhatverCaps", 4)
puts yet_another_new_class.instance_variable #=> "instance variable"
puts yet_another_new_class.options #=> {:name => "Whatever"}
puts yet_another_new_class.name #=> WhateverCaps
puts yet_another_new_class.parameter #=> 4
puts yet_another_new_class.argument #=> string

yet_another_new_class.new_variable = ["one","two","three","four","five","six"] #=> setting this without initalizing ["one", "two", "three", "four", "five", "six"]

