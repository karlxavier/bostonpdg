App.item_messages = App.cable.subscriptions.create "ItemMessagesChannel",
  connected: ->
    console.log 'item connected'

  disconnected: ->
    console.log 'item disconnected'

  received: (data) ->
    console.log 'item message received'
    active_chatroom = $("[data-behavior='messages'][data-item-chatroom-id='#{data.item_id}']")

    if active_chatroom.length > 0
      active_chatroom.append(data.message)

      chat_messages = $("#chat_messages")[0]
      if chat_messages
        height = chat_messages.scrollHeight
        $(chat_messages).scrollTop(height)

      $("#new_item_message")[0].reset()
    else
      chatroom_badge = $("[data-behavior='chatroom-badge'][data-item-chatroom-id='#{data.item_id}']")
      if chatroom_badge[0]
        badge_value = chatroom_badge[0].innerHTML
        badge_value++
        chatroom_badge[0].innerHTML = badge_value
        chatroom_badge[0].className += "badge badge-warning"
      else
          toastr.options =
          closeButton: true
          progressBar: true
          showMethod: 'slideDown'
          positionClass: 'toast-bottom-left'
          timeOut: 7000
          toastr.warning data.username + ' sent a message in ' + data.item_name , 'New Message'
