
class OpenAiService
  def initialize
    @client = OpenAI::Client.new
  end

  def call_openai(messages)
    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: Message.for_openai(messages), # Required.
        temperature: 0
      })

    response["choices"][0]["message"]["content"]
  end
end
