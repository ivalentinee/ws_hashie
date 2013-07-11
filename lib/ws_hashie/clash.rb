module WsHashie
  class Clash < Hash
    def initialize parent = nil
      @parent = parent
    end

    def _end!
      @parent
    end

    def method_missing(name, *args, &block)
      name_s = name.to_s
      case name_s[-1, 1]
      when '!'
        key = (name_s.chomp '!').to_sym
        self[key] = Clash.new(self)
        self[key]
      else
        if self[name]
          self[name].merge! args[0]
        else
          self[name] = args[0]
        end
        self
      end
    end
  end
end
