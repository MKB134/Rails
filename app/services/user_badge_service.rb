class UserBadgeService
  RULES = {
    all_tests_from_category: 'AllTestsFromCategory',
    all_tests_passages: 'AllTestsPassages',
    test_first_passage: 'TestFirstPassage'
  }.freeze

  class << self
    def call(test_passage)
      @test_passage = test_passage
      Badge.find_each do |badge|
        rule = call_badge_rule(badge)
        @test_passage.user.badges.push(badge) if rule.match?
      end
    end

    private

    def call_badge_rule(badge)
      "Rules::#{RULES[badge.value.to_sym]}".constantize.new(rule_options: badge.rule_options, test_passage: @test_passage)
    end
  end
end
