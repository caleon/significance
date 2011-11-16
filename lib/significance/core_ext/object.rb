class Object # `significant == self` is the way to end the recursion.
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
  
  def significant?
    !blank? and significant == self
  end

  def significant
    self
  end
  
  def keep_significant
    respond_to?(:replace) ? replace(significant) : significant
  end

  def significant!
    keep_significant
  end

  def significance
    significant? ? significant : nil
  end

  def significant_significance
    significant.significance
  end

  def significant_significance?
    significant_significance.significant?
  end
  alias_method :sigsig,   :significant_significance
  alias_method :sigsig?,  :significant_significance?
end
