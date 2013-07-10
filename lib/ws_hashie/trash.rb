module WsHashie
  class Trash < Dash
    def self.property(name, options = {})
      super
      if options[:from]
        define_method(options[:from]) do
          @properties[name]
        end
      end
    end
  end
end
