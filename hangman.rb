#!/usr/bin/env ruby

word_bank = ["terminal", "launch academy", "boston", "macbook", "sommerville"]

puts "Welcome to Hangman!"
word = word_bank.sample
word_letters = word.split('')
puts word_letters
puts word
print "Word:" 
for letter in word_letters  do 
  print " _" 
end