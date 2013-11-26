#!/usr/bin/env ruby
require 'pry'
word_bank = ["launch", "steelers", "Academy", "Ruby", "Rails", "Coding", 
"bosotn", "Austin", "cool", "fun"]
letter_places=[]
puts "Welcome to Hangman!"
  word = word_bank.sample.downcase
  word_letters = word.split('')
  chances = word_letters.length + 5




word_length = word.length
letter_dashes = ('_') * word_length
@word_blanks = letter_dashes.split('')
puts @word_blanks.join

letters_index = {}
@letters_used = []


word_letters.each_with_index do |item, index|
  letters_index[item] = letters_index[item] || []
  letters_index[item] << index
end

until @word_blanks.join == word || chances == 0
puts "Number of Chances Remaining: #{chances}"
puts "Guess a letter (a-z) or a entire word"
guess=gets.chomp  
if word_letters.include?(guess)
    letters_index_in_word = letters_index[guess]
    letters_index_in_word.each do |index|
    @word_blanks[index].replace(guess)
  end
  print @word_blanks.join.upcase
end
if !word_letters.include?(guess)
  chances -= 1
  print @word_blanks.join
  puts 
  puts "Sorry there are no #{guess}'s guess again"
  @letters_used << guess
  print @word_blanks.join.upcase
end
  if @letters_used.count > 1
    puts ''
    puts "Letters Used: #{@letters_used.join(",").upcase}"
  elsif @letters_used.count == 1
    puts ''
    puts "Letters Used: #{@letters_used}"
  end
end

if @word_blanks.join == word
  puts''
  puts "Congrats you guessed correct you win!"
else 
  puts''
  puts "Out of turns you lose! haha".upcase
end






