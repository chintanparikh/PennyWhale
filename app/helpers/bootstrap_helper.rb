module BootstrapHelper
	# tabs needs to be an array of hashes with the following:
	# {ticker: 'TCKR', id: 'unique_identifier', content: 'html for the tabs'}
	def make_tabs tabs
		markup = '<ul class="nav nav-tabs">'
		tabs.each do |tab|
			markup += "<li class='#{'active' if tab.equal? tabs.first}'><a href='##{tab[:ticker] + tab[:id]}' data-toggle='tab'>#{tab[:ticker]}</a></li>"
		end
		markup += '</ul>'

		markup += '<div class="tab-content">'
		tabs.each do |tab|
			markup += "<div class='tab-pane #{'active' if tab.equal? tabs.first}' id='#{tab[:ticker] + tab[:id]}'>#{tab[:content]}</div>"
		end
		markup += '</div>'
	end

	def flash_messages_for key, css_class
		output = ''
		output += "<div class='alert-#{css_class} alert fade in alert-dismissable'>#{flash[key]}<button class='close' data-dismiss='alert'>&times;</button></div>" if flash[key]

		if flash["#{key}_array".to_sym]
		  flash["#{key}_array".to_sym].each do |message|
		    output += "<div class='alert-#{css_class} alert fade in alert-dismissable'>
		    					    #{message}
		    					  <button class='close' data-dismiss='alert'>&times;
		    					  </button>
		    					</div>"
			end
		end		
		output
	end
end
