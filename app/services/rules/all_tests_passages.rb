module Rules
  class AllTestsPassages < AllRules
    def match?
      value = badge.value.to_i

      return if value != @test.level

      test_ids = Test.with_questions.where(level: value).pluck(:id)
      @test_passage.badges << badge if @user.passed_tests?(test_ids)
    end
  end
end
