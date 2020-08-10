## Week Two - Oyster Card Challenge

#### In this challenge I aim to use the knowledge I gained from last week to build a more complex system and te test TDD, rspec and OOD

## User Stories 

```
In order to use public transport
As a customer
I want money on my card
```
```
In order to keep using public transport  
As a customer  
I want to add money to my card  
```
```
In order to protect my money
As a customer
I don't want to put too much money on my card
```
```
In order to pay for my journey  
As a customer  
I need my fare deducted from my card  
```
```
In order to get through the barriers
As a customer
I need to touch in and out
```
```
In order to pay for my journey  
As a customer  
I need to have the minimum amount for a single journey  
```
```
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```
```
In order to pay for my journey  
As a customer  
I need to know where I've travelled from  
```
```
In order to know where I have been
As a customer
I want to see to all my previous trips
```
```
In order to know how far I have travelled  
As a customer  
I want to know what zone a station is in  
```
```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```
```
In order to be charged the correct amount  
As a customer  
I need to have the correct fare calculated  
```

## Code Journal

_*The journal is split into sections by user story*_

### No.1

```
In order to use public transport  
As a customer  
I want money on my card  
```

_*To start things off here, I described an Oystercard class in my spec file and check for a new instance to have a balance of 0. Requiring the file to read the code.*_

**require 'oystercard'**

**describe Oystercard do**

  **it 'Balance of new card as zero' do**  
  	**expect(subject.balance).to eq(0)**  
  **end**  
**end**  

_*In Ruby I then created an Oystercard class within a new file 'oystercard.rb'. From there I defined a method 'balance' containing 0 to comply with my test. It was green from here so I then refactored my code in order that each new card could be provided with a balance. I did this using attr_reader :balance as a replacement for the method and initialized each new card with a balance of 0.*_

**class Oystercard**  

  **attr_reader :balance**  

  **def initialize**  
  	**@balance = 0**  
  **end**  
**end**  

### No.2

```
In order to keep using public transport
As a customer
I want to add money to my card
``` 

_*Next up was to enable a way that the customer can top-up their oystercard. to start this I created a new test to check that any given Oystercard could respond to a 'top_up' method with a single argument (being the amount they wish to top up!)*_

**it { is_expected.to respond_to(:top_up).with(1).argument }**  

_*This then passed once simply definiing the method with an arg.*_

**def top_up(amount)**  
**end**  

_*Then I added a more specific test to check that the balance inst_var was being updated with the amount specified from the top_up argument*_

**describe 'top_up' do**  
  **it 'receives input balance correctly' do**  	
  	**card = OysterCard.new**  
  	**card.top_up(100)**  
  	**expect(card.balance).to eq 100**  
  **end**  
**end**  

_*Filling out my new method to add the 'amount' to my balance inst_var was then enough to pass the next test.*_

**def top_up(amount)**  
  **@balance = @balance + amount**  
**end**  

_*It was then time to refactor these sections to smarten them up a bit. Firstly a simple refactor of my new method.*_

**@balance += amount**  

_*Then the test, using '.to change' now to really condense things down.*_

**it 'receives input balance correctly' do**  
  **expect{ subject.top_up 1 }.to change{ subject.balance }.by 1**  
**end**  

### No.3

```
In order to protect my money
As a customer
I don't want to put too much money on my card
```

_*This user story is asking me to ensure that there is a limit to how much the customer can top_up. I can set a limit for each card which will prevent the customer from accidently topping up vast quantities of money.*_

**it 'Balance should not exceed 90' do**  
  **full_balance = OysterCard::LIMIT**  
  **subject.top_up(full_balance)**   
  **expect { subject.top_up 1 }.to raise_error 'Balance limit reached'**  
**end**  

 _*The above test assumes a balance limit in the form of a CONST: LIMIT. I then set the balance to the LIMIT and attempt to top up by 1, expecting an error to be raised 'Balance limit reached'*_

**class OysterCard**  
  **LIMIT = 90**  

_*Limit constant set.*_

**def top_up(amount)**  
  **fail 'Balance limit reached' if @balance + amount > LIMIT**  
  **@balance += amount**  
**end**  

_*Top_up method updated to include fail if balance exceeds the new limit.*_

### No.4

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

_*Here I'm doing much of the same as with the top_up method, but for deducting money from the card.*_

**it { is_expected.to respond_to(:deduct).with(1).argument }**  

_*I start with this simple test to check the card and method are on speaking terms. It's safe to assume the 1 argument.*_

**def deduct(amount)**  
**end**  

_*Method made to pass the test.*_

**describe 'deduct' do**    

  **it 'deduct from balance' do**  
  	**subject.top_up(1)**  
  	**expect{ subject.deduct 1 }.to change{ subject.balance }.by -1**  
  **end**  

_*Again, a very similiar test to one for top_up, checking it's primary function is working.*_

**def deduct(amount)**  
   **@balance -= amount**  
**end**  

**it 'prevents use of card at 0 balance' do**  
  **card = OysterCard.new**  
  **subject.top_up(1)**  
  **expect { card.deduct 1 }.to raise_error "Time to top up! Balance: 0"**  
**end**  

_*This last test is to ensure no spending of imaginary funds!*_
_*The method thus far:*_

**def deduct(amount)**  
  **fail "Time to top up! Balance: 0" if balance == 0**    
  **@balance -= amount**  
**end**  

### No.5

```
In order to get through the barriers.
As a customer
I need to touch in and out.
```

