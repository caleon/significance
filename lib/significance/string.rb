unless String.instance_methods.include?(:strictly_significant_string)
  class String
    # The following is overkill right now, as the only necessarily insignificant characters are whitespace.
    #def significant; chars.select(&:significant?).join; end
    #def significant; gsub(/\s+/, ''); end # whoa that does not have the effect i want it to have.
    def significant
      strip
    end
    
    def strictly_significant_string
      gsub(/\s+/, '')
    end
  end
end