class Kandan.Plugins.AutoResizeTextarea

  @init: ->
    baseHeight = 40
    min = 40
    max = 80
    $(document).on 'keydown', '.chat-input', (e) ->
      setTimeout => # 改行を入力した瞬間はval()に改行がないので、setTimeoutで遅延させて改行が入ってから処理する
        height = baseHeight * $(this).val().split("\n").length
        height = Math.min(max, Math.max(height, min))
        $(this).parent().children().each (_, elm) ->
          $(elm).css({height})
      , 0
