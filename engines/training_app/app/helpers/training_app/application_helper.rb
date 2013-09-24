require "redcarpet"

module TrainingApp::ApplicationHelper
  def markdown(text)
    return "" unless text.present?
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    @renderer.render(text).html_safe
  end
end
