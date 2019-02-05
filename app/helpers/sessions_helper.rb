module SessionsHelper

  def flash_message
    flash.map do |key, msg|
      content_tag :p, msg, :id => key, :class => 'flash'
    end.join.html_safe
  end

end
