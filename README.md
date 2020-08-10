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
### recognise the oystercard file
describe Oystercard do 
### Checking new card has 0 balance
  it 'Balance of new card as zero' do
  	expect(subject.balance).to eq(0)
  end

* In Ruby I then created an Oystercard class within a new file 'oystercard.rb'. From there I defined a method 'balance' containing 0 to comply with my test. It was green from here so I then refactored my code in order that each new card could be provided with a balance. I did this using attr_reader :balance as a replacement for the method and initialized each new card with a balance of 0.

``
### Oystercard class created
class Oystercard
### Balance method refactored into attr_reader
  attr_reader :balance
### Initializing a balance on the new card. Set at 0
  def initialize
  	@balance = 0
  end
end
``


