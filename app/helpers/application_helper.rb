module ApplicationHelper
  def flash_message type, text
    type = "#{type}_array"
    flash.now[type] ||= []
    flash.now[type] << text
  end

  def flash_messages type, messages
    messages.each do |message|
      flash_message type, message
    end
  end
end
