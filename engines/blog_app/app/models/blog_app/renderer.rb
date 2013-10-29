require 'redcarpet'
require 'pygments'

module BlogApp
  class HTMLwithPygments < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants

    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  class Renderer
    def self.render(body)
      r = self.new.renderer
      r.render(body)
    end

    def renderer
      options = { no_intra_emphasis: true, fenced_code_blocks: true }
      @renderer = Redcarpet::Markdown.new(HTMLwithPygments, options)
    end
  end
end