module WsHashie
  class Dash
    @@properties = Hash.new
    @@required = Array.new

    def initialize(values = {})
      @properties = @@properties.merge values
      @@required.each {|name| argument_error(name) if @properties[name].nil?}
    end

    def [](name)
      if @@properties.has_key? name
        @properties[name]
      else
        raise NoMethodError
      end
    end

    def self.property(name, options = {})
      @@properties[name] = options[:default]
      @@required << name if options[:required]
      define_method(name) do
        if @properties.has_key? name
          @properties[name]
        else
          argument_error name
        end
      end
      define_method("#{name}=") do |value|
        if @@required.include?(name) && value.nil?
          argument_error name
        else
          @properties[name] = value
        end
      end
    end

    private
    def argument_error(argument_name)
      raise (ArgumentError.exception "The property '#{argument_name}' is required for this Dash.")
    end
  end
end
