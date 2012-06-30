require 'open-uri'

# Require the ActiveSupport::Cache module
require 'active_support/cache'

module Jekyll
  class GistTag < Liquid::Tag
    def initialize(tag_name, gist_ref, tokens)
      @gist_ref = gist_ref.strip
      @gist_id, @filename = @gist_ref.split('/')
      @filequery = ''
      @fileanchor = ''
      if @filename
        @fileanchor = '#file_' + @filename.gsub(/-/,'_')
        @filequery = '?file=' + @filename
      end
      super
    end
    
    # A simple file-based cache in ./_tmp shared by all GistTag instances
    def cache
      @@cache ||= ActiveSupport::Cache::FileStore.new("_tmp/gist")
    end
    
    # Return from cache if possible; otherwise fetch and add it to cache
    def fetch_gist(raw_gist_uri)
      cache.fetch(raw_gist_uri) do
        open(raw_gist_uri).read.chomp
      end
    end
  
    def render(context)
      if @filename
        lang = @filename.split('.').last
      else
        lang = 'sh'
      end

      script_url = "https://gist.github.com/#{@gist_id}.js#{@filequery}"
      link_url = "https://gist.github.com/#{@gist_id}/#{@fileanchor}"
      raw_url = "https://raw.github.com/gist/#{@gist_id}/#{@filename}"

      #raw_uri = "https://gist.github.com/raw/#{@gist_id}/#{@filename}"
      #script_uri = "https://gist.github.com/#{@gist_id}.js?file=#{@filename}"

      code = fetch_gist(raw_url)
      pretty = Albino.colorize(code, lang)

      
#<div id="gist-#{@gist_ref.gsub(/[^a-z0-9]/i,'-')}">
#<script src="#{script_uri}"></script>
#<noscript>
##{pretty}
#</noscript>
#</div>

      <<MARKUP.strip
<div id="gist-#{@gist_ref.gsub(/[^a-z0-9]/i,'-')}" class="gist">
#{pretty}
<p><small class="pull-right gist-link"><a href="#{link_url}">view the gist &raquo;</a></small></p>
</div>
MARKUP
    end
  end
end

Liquid::Template.register_tag('gist', Jekyll::GistTag)
