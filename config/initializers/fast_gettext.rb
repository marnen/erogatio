default_domain = 'erogatio'
FastGettext.add_text_domain default_domain, :path => 'locale', :type => :po
FastGettext.default_available_locales = %w[en]
FastGettext.default_text_domain = default_domain
