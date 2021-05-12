require "byebug"

class Stack
    def initialize
        @ivar = []
    end

    #adds an element to the stack
    def push(el)
        @ivar << el 
    end

    #removes one element from the stack
    def pop
        @ivar.pop 
    end

    #returns, but doesnt remove, the top element in the stack
    def peek
        return @ivar[-1]
    end
end

class Queue
    def initialize 
        @ivar = []
    end

    #add element to the Queue
    def enqueue(el)
        @ivar << el
    end

    #removes the first element of the Queue
    def dequeue
        @ivar.shift
    end

    #shows, but does not remove, the first element in the queue
    def peek 
        return @ivar[0]
    end
end

class Map
    def initialize 
        @ivar = []
    end

    #add key value pair if it doesnt already exist or update the value of the key
    def set(key, val)
        if key_in_map?(@ivar,key)
            update_key(key,val)
        else
            @ivar << [key, val]
        end
    end

    #Map Element -> Boolean
    #check if the key is already in map
    def key_in_map?(arr,key)
        if arr.empty?
            return false
        else
            if arr[0][0]  == key
                return true 
            else
                key_in_map?(arr[1..-1], key)
            end
        end
    end

    #Element Element -> Map!
    #Find the key and update the value
    def update_key(key, val)
        @ivar.each_with_index do |ele, i|
            if ele[0] == key
                @ivar[i][1] = val 
            end
        end
    end
end
