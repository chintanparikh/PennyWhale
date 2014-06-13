module ApplicationHelper
  def flash_message type, message
    flash.now[type] = message
  end

  def flash_messages type, messages
    messages.each do |message|
      flash.now[type] = message
    end
  end
end
