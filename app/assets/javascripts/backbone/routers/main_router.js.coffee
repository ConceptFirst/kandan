class Kandan.Routers.Main extends Backbone.Router

  routes:
    '': 'index'
    'channels-:channel_id': 'index'

  index: (channel_id)->
    console.log("index channel: #{channel_id} =================================")
    # メモ: 初期化済みでなければ初期化する部分 -> タブのswitch、とすれば良さそう
    view = new Kandan.Views.ChatArea()
    $('#channels').replaceWith(view.render().el)
    $('.channels').tabs()
