require 'ostruct'

# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  history    :json
#  q_and_a    :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chat < ApplicationRecord
  belongs_to :user

  attr_accessor :message

  def message=(message)
    messages = [{role: "system", content: message}]

    q_and_a.each do |question, answer|
      messages << {role: "user", content: question}
      messages << {role: "assistant", content: answer}  
    end 
  messages << {role: "user", content: message} if q_and_a.size > 1

    

    response_raw = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: messages, 
          temperature: 0.7,
          max_tokens: 500, 
          top_p: 1.0,
          frequency_penalty: 0.0,
          presence_penalty: 0.6
      } 
    )
    Rails.logger.debug response_raw
    response = JSON.parse(response_raw.to_json, object_class: OpenStruct) 
    self.q_and_a << [message, response.choices[0].message.content]
  end 

  private 

  def client 
    OpenAI::Client.new
  end 
end
