class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test

    assign_badges
  end

  private

  def assign_badges
    return unless @test_passage.success?

    Badge.all.each do |badge|
      send(badge.rule_name, badge)
    end
  end
end
