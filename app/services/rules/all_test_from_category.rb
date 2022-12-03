module Rules
  class AllTestsFromCategory < AllRules
    def match?
      return false unless @test_passage.successful

      tests_ids = Test.where(category_id: @rule_options).ids
      test_passages_ids = TestPassage.successful.where(user_id: @user.id, test_id: tests_ids).count
      tests_ids.count == test_passages_ids
    end
  end
end

список тестов, оперидилить к какой категории относится данный тест,
