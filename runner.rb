require_relative "giphy"
require_relative "message"
require 'pry'

puts "What do you want to say?"
this_message = gets.chomp

puts "What gif do you want?"
gif_search = gets.chomp

m = Message.new(this_message, "+12242340123")

g = Giphy.mms_search(gif_search)

t = Giphy.trending

m.mms_send(t.first)
