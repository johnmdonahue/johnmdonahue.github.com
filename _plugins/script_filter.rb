module Jekyll
  module AssetFilter
    def script_filter(post)
      out = post
      out = out.gsub(/<script[^>]*>[^<]*<\/script>/, '')
      out = out.gsub(/<noscript[^>]*>(.*?(?<!\\))<\/noscript>/, '\1')
      out
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)