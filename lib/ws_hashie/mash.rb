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
        @hash.has_key?(key)
      when '='
        key = name_s.chomp '='
        @hash[key] = args[0]
      when '!'
        key = name_s.chomp '!'
        @hash[key] ||= Mash.new
        @hash[key]
      when '_'
        key = name_s.chomp '_'
        value = @hash[key]
        if value.class == Mash
          value
        else
          Mash.new
        end
      else
        @hash[name_s]
      end
    end
  end
end
