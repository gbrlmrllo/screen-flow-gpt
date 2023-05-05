
class OpenAiService
  def initialize
    @client = OpenAI::Client.new
  end

  def call_openai(prompt)
    @client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: messages(prompt), # Required.
        temperature: 0,
        stream: proc do |chunk, _bytesize|
          print chunk.dig("choices", 0, "delta", "content")
        end
      })
  end

  private

  def messages prompt
    [
      { role: 'system', content: 'You are a helpful assistant.' },
      { role: 'user', content: prompt }
    ]
  end
end