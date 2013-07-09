module WsHashie
  class Mash
    def initialize
      @hash = Hash.new
    end
    
    def method_missing(name, *args, &block)
      if name.to_s.end_with?('?')
        key = name.to_s.chomp('?')
        key?(key)
      else if name.to_s.end_with?('=')
        key = name.to_s.chomp('=')
        value!(key, args[0])      
      else 
        key = name
        value(key)
      end 
      end
    end

    def inspect
      return "<#{self.class} name=\"#{@hash[:name]}\">"
    end
    
    private
    def value(key)
      @hash[key]
    end
    
    def value!(key, value)
      @hash[key.to_sym] = value
    end
    
    def key?(key)
      !@hash[key.to_sym].nil?
    end
    
  end
end
