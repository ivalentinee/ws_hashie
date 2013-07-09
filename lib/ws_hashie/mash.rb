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
      return "<#{self.class}#{hash_to_s}>"
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
    
    def hash_to_s
      str = @hash.reduce("") {|str, (key, value)| str + " #{key}=\"#{value}\","}
      str.chomp(',')
    end
  end
end
