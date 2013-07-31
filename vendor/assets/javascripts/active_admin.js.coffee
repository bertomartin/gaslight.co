#= require active_admin/base
#= require epiceditor/js/epiceditor.min
#= require chosen.jquery

$ ->
  if $('#editor').length > 0
    opts =
      container: 'editor'
      textarea: 'post_body'
      basePath: '/assets/epiceditor'
      clientSideStorage: false

    editor = new EpicEditor(opts).load()

  $('.chzn-select').chosen
      allow_single_deselect: true
      no_results_text: 'No results matched'
      width: '79%'

  $(".chzn-choices").bind("DOMSubtreeModified", ->
    $(".tag-list-as-string").val(
      $(".search-choice span").toArray().map(
        (elem) -> return elem.innerHTML
      ).join(','))
  );
