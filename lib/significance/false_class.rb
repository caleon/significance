unless false.significant? == true
  class FalseClass
    def significant?
      true
    end
  end
end