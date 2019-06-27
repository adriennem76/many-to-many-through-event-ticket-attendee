class Attendee
    @@all = []

    attr_reader :name, :age

    def initialize (name, age)
        @name = name
        @age = age
        @@all << self
    end

    def events 
        Ticket.all.select {|ticket| ticket.attendee == self}
    end

    def money_spent
        self.events.sum {|ticket| ticket.event.ticket_price}
    end

    def self.all
        @@all
    end
end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events