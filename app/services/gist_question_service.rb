class GistQuestionService
  Result = Struct.new(:success?,:html_url)

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client =  client
  end

  def call
    response = @client.create_gist(gist_params)
    Result.new(response.html_url.present?, response.html_url)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end

  def gist_params
    {
      "description": I18n.t('.gist_description', title: @test.title),
      "public": true,
      "files": {
        "test-guru-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
