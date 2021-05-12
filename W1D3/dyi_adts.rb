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

