require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}

        rooms.each { |key, val| @rooms[key] = Room.new(val) }
    end

    def name
        @name.split(' ').map { |el| el.capitalize }.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(roomName)
        @rooms.key?(roomName)
    end

    def check_in(person, roomName)
        if !room_exists?(roomName)
            p "sorry, room does not exist"
        else
            if @rooms[roomName].add_occupant(person)
                p "check in successful"
            else  
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each_value { |room| return true if !room.full? }

        false
    end

    def list_rooms
        @rooms.each { |name, room| puts(name + ". Available space: " + room.available_space.to_s)}
    end
end
