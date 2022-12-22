module Rules
  class TestFirstPassage < AbstractRuleSpecification
    def match?
      return false unless @test_passage.successful

      test_passage = TestPassage.successful.where(user: @user)
      test_passage.count == 1
    end
  end
end
