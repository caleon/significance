class Array # now it's deep.
  def significant
    select(&:significant_significance?).map(&:significant)
  end
end
