module Jekyll
  class GistTag < Liquid::Tag
    def initialize(tag_name, gist_ref, token)
      # gist_ref is in the form of `gist_id` or `gist_id/filename`
      @gist_id, @filename = gist_ref.strip.split('/')
    end

    def render(context)
      if @gist_id.length >= 5
        script_url = "https://gist.github.com/#{@gist_id}.js?file=#{@filename}"
        link_url = "https://gist.github.com/#{@gist_id}/#file_#{@filename.gsub(/-/,'_')}"
        raw_url = "https://raw.github.com/gist/#{@gist_id}/#{@filename}"
        
        "<script src='#{script_url}'></script><noscript><a href='#{link_url}'>View the gist &raquo;</a></noscript>"
      end
    end
  end
end

Liquid::Template.register_tag('gist', Jekyll::GistTag)