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