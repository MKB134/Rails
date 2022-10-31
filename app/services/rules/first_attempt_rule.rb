module Rules
  class RuleOneByAttemptsSpecification < AbstractRuleSpecification
    def first_attempt_rule(badge)
      return unless TestPassage.where(user_id: @user.id, test_id: @test.id).count == 1

      @test_passage.badges << badge
    end
  end
end
