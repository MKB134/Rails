module Rules
  class TestFirstPassage < AbstractRuleSpecification
    def match?
      return false unless @test_passage.sucessful

      test_passage = TestPassage.sucessful.where(user: @user)
      test_passage.count == 1
    end
  end
end
