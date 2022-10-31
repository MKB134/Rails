module Rules
  class RuleOneByAttemptsSpecification < AbstractRuleSpecification
    def category_rule(badge)
      value = badge.value.to_i

      return if value != @test.category_id

      test_ids = Test.with_questions.where(category_id: value).pluck(:id)
      @test_passage.badges << badge if @user.passed_tests?(test_ids)
    end
  end
end
