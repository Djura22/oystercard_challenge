## Oyter Card Challenge

### In this challenge I aim to use the knowledge I gained from last week to build a more complex system and te test TDD, rspec and OOD


## User Stories

### No.1

``
In order to use public transport  
As a customer  
I want money on my card  
``

* To start things off here, I described an Oystercard class in my spec file and check for a new instance to have a balance of 0. Requiring the file to read the code.

require 'oystercard'

describe Oystercard do 

  it 'Balance of new card as zero' do  
  	expect(subject.balance).to eq(0)  
  end  

* In Ruby I then created an Oystercard class within a new file 'oystercard.rb'. From there I defined a method 'balance' containing 0 to comply with my test. It was green from here so I then refactored my code in order that each new card could be provided with a balance. I did this using attr_reader :balance as a replacement for the method and initialized each new card with a balance of 0.



class Oystercard

  attr_reader :balance

  def initialize  
  	@balance = 0  
  end  
end  

* Next up was to enable a way that the customer can top-up their oystercard. to start this I created a new test to check that any given Oystercard could respond to a 'top_up' method with a single argument (being the amount they wish to top up!)


  it { is_expected.to respond_to(:top_up).with(1).argument }

* This then passed once simply definiing the method with an arg.

def top_up(amount)  
end

* Then I added a more specific test to check that the balance inst_var was being updated with the amount specified from the top_up argument

 describe 'top_up' do  
  	it 'receives input balance correctly' do  	
  	  card = OysterCard.new  
  	  card.top_up(100)  
  	  expect(card.balance).to eq 100  
    end  
  end  

* Filling out my new method to add the 'amount' to my balance inst_var was then enough to pass the next test.

def top_up(amount)  
  	@balance = @balance + amount  
  end  

* It was then time to refactor these sections to smarten them up a bit. Firstly a simple refactor of my new method.

@balance += amount  

* Then the test, using '.to change' now to really condense things down.

it 'receives input balance correctly' do  
    	expect{ subject.top_up 1 }.to change{ subject.balance }.by 1  
    end  






