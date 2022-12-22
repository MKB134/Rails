module Rules
  class AbstractRuleSpecification
    def initialize(rule_options:, test_passage:)
      @rule_options = rule_options
      @test_passage = test_passage
      @user = @test_passage.user
      @test = @test_passage.test
    end

    def match?
      raise "#{__method__} undefined for #{self.class}"
    end
  end
end
