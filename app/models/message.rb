class Message < ApplicationRecord
  belongs_to :page
  has_one :response

  enum role: { system: 0, assistant: 10, user: 20 }

  def self.for_openai(messages)
    messages.map { |message| { role: message.role, content: message.content } }
  end
end
