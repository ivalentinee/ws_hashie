module WsHashie
  class Mash
    def initialize
      @hash = Hash.new
    end
    
    def method_missing(name, *args, &block)
      name_s = name.to_s
      case name_s[-1, 1]
      when '?'
        key = name_s.chomp '?'
        key? key
      when '='
        key = name_s.chomp '='
        value! key, args[0]
      when '!'
        key = (name_s.chomp '!').to_sym
        @hash[key] ||= Mash.new
        @hash[key]
      when '_'
        key = (name_s.chomp '_').to_sym
        value = @hash[key]
        if value.class == Mash
          value
        else
          Mash.new
        end
      else
        key = name
        value key
      end
    end

    private
    def value(key)
      value = @hash[key.to_sym]
      if value.class == Mash
        value.inspect
      else
        value
      end
    end
    
    def value!(key, value)
      @hash[key.to_sym] = value
    end
    
    def key?(key)
      !@hash[key.to_sym].nil?
    end
  end
end
