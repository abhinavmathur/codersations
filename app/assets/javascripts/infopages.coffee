$ ->
  #WYSIHTML5 setting
  window['rangy'].initialized = false
# to set summernote object
# You should change '#post_content' to your textarea input id
  summer_note = $('#infopage_content, #info_content, #snippet_content')

  # to call summernote editor
  summer_note.summernote
# to set options
    height:500
    lang: 'ko-KR'
    toolbar: [
      [
        'style'
        [ 'style' ]
      ]
      [
        'font'
        [
          'bold'
          'italic'
          'underline'
          'clear'
        ]
      ]
      [
        'fontname'
        [ 'fontname' ]
      ]
      ['fontsize', ['fontsize']]
      [
        'color'
        [ 'color' ]
      ]
      [
        'para'
        [
          'ul'
          'ol'
          'paragraph'
        ]
      ]
      [
        'height'
        [ 'height' ]
      ]
      [
        'table'
        [ 'table' ]
      ]
      [
        'insert'
        [
          'link'
          'picture'
          'video'
        ]
      ]
      [
        'view'
        [ 'fullscreen' ]
      ]
      [
        'help'
        [ 'help' ]
      ]
    ]
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
# alert $('#post_content').code()
    summer_note.val summer_note.code()
    true
