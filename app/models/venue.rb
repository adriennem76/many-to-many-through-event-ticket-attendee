class Venue

    @@all = []

    attr_reader :name, :location
    attr_accessor :rental_fee

    def initialize (name, location, rental_fee)
        @name = name
        @location = location
        @rental_fee = rental_fee
        @@all << self
    end

    def self.all
        @@all
    end

    def events
        Event.all.select {|event| event.venue == self}
    end

    def revenue
        self.events.count * rental_fee
    end

    def attendees
        attendees = self.events.collect {|event| event.attendees} 
        attendees.flatten.uniq
    end

    def guest_lists
        guest_lists = []
        self.events.each {|event| guest_lists << {event.name => ""}}
        self.events.each do |event|
            guest_lists.each do |hash|
                binding.pry
                hash.each do |key, value|
                    if key == event.name
                    key = event.attendees
                    end
                end
            end
        end
        guest_lists
    end

end