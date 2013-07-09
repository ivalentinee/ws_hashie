module WsHashie
  class Mash
    def name?
      !@name.nil?
    end

    def name=(name)
      @name = name
    end

    def name
      @name
    end
  end
end
