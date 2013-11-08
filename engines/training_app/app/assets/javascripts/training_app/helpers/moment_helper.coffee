Ember.Handlebars.helper 'time', (seconds, options) ->
  return unless seconds?
  parsedTime = moment.utc(seconds * 1000)
  formatter = if parsedTime.hours() > 0 then "H:mm:ss" else "m:ss"
  "#{parsedTime.format(formatter)}"