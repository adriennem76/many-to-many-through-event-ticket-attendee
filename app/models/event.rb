class Event

    @@all = []

    attr_reader :name, :total_cost, :ticket_price

    def initialize (name, total_cost, ticket_price)
        @name = name
        @total_cost = total_cost
        @ticket_price = ticket_price
        @@all << self
    end

    def self.all
        @@all
    end

    def sell_to_break_even
        revenue = self.attendees.count * ticket_price
        remaining_cost = total_cost - revenue
        if remaining_cost < 0
            0
        else
            tix_to_sell = remaining_cost / ticket_price
            tix_to_sell.ceil
        end
    end

    def attendees
        tickets = Ticket.all.select {|ticket| ticket.event == self}
        tickets.collect {|ticket| ticket.attendee}
    end

    def average_age
        ages = self.attendees.collect {|attendee| attendee.age}
        avg_age = ages.sum / ages.count
    end

end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0. 
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
