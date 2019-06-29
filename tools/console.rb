require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:

lucy = Attendee.new("Lucy", 22)
george = Attendee.new("George", 24)
miles = Attendee.new("Miles", 18)

venue1 = Venue.new("stadium", "D.C.", 1500)
venue2 = Venue.new("blackbox", "Baltimore", 500)

concert = Event.new("concert", 100000, 50, venue1)
play = Event.new("play", 50000, 20, venue2)
poetry = Event.new("poetry", 1, 5, venue2)

ticket1 = Ticket.new(lucy, play)
ticket2 = Ticket.new(lucy, concert)
ticket3 = Ticket.new(miles, concert)
ticket4 = Ticket.new(george, play)
ticket5 = Ticket.new(george, poetry)

#The variable `lucy` will point to an instance of a new attendee
venue1.guest_lists
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
