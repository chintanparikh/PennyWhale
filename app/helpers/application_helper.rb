module ApplicationHelper
  def flash_message type, text
    flash.now[type] ||= []
    flash.now[type] << text
  end

  def flash_messages type, messages
    messages.each do |message|
      flash_message type, message
    end
  end
end
