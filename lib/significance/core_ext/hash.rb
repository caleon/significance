class Hash # also deep now.
  def significant
    Hash.new.tap { |hsh| each(&significance_each_block(hsh)) }
  end # much faster.

  # also allows nil so we don't need Something.new(params.merge(params[:etc] || {}))
  def significant_merge(other_hash={})
    return self unless (other_hash ||= {}).significant?
    merge(other_hash.significant)
  end
  # destructive
  def significant_merge!(other_hash={})
    return self unless (other_hash ||= {}).significant?
    merge!(other_hash.significant)
  end
  # need to call significant on self now.
  def reverse_significant_merge(other_hash={})
    return significant if (other_hash ||= {}).blank?
    significant.reverse_merge(other_hash)
  end
  # or keep_significant for destructive
  def reverse_significant_merge!(other_hash={})
    return keep_significant if (other_hash ||= {}).blank?
    keep_significant.reverse_merge!(other_hash)
  end

  private # relies on ActiveSupport core_ext which defines #blank? for classes. A value of False is part of a significant key-val pair.
  #def significance_select_block; Proc.new {|k, v| v.significant? }; end
  # To do an option for :significant_keys is not easy, as deeper calls to Hash#significant won't have the same options.
  def significance_each_block(hsh={})
    Proc.new { |k, v| v.significant_significance.tap { |res| res and hsh[k] = res } }
  end
end
