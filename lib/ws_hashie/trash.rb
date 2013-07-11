module WsHashie
  class Trash < Dash
    def initialize(values = {})
      translations.each do |key, value|
        if values.has_key? key
          values[translations[key]] = values[key]
          values.delete(key)
        end
      end
      super
    end

    def translations
      (self.class.instance_variable_get(:@translations))
    end

    def self.property(name, options = {})
      super
      @translations ||= {}
      @translations[options[:from]] = name if options[:from]
      options[:transform_with] ||= options[:with]
      if options[:transform_with]
        define_method(name) do
          if properties.has_key? name
            options[:transform_with].(@values[name])
          else
            argument_error name
          end
        end
      end
    end
  end
end
