class String
  # The following is overkill right now, as the only necessarily insignificant characters are whitespace.
  #def significant; chars.select(&:significant?).join; end
  #def significant; gsub(/\s+/, ''); end # whoa that does not have the effect i want it to have.
  def significant
    strip
  end

  def strictly_significant
    gsub(/\s+/, '')
  end
end
