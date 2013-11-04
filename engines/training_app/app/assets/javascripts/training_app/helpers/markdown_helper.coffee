Training.markdownConverter = new Showdown.converter()

Ember.Handlebars.helper 'markdown', (text, options) ->
  return unless text?
  return new Handlebars.SafeString(Training.markdownConverter.makeHtml(text))