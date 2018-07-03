App.chatroom_orders = App.cable.subscriptions.create "ChatroomOrdersChannel",
	connected: ->
    console.log 'chika-minute!'

  disconnected: ->
    console.log 'chatroom disconnected'

  received: (data) ->
    console.log 'message received'
    $("#new_message")[0].reset()
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")

    if active_chatroom.length > 0
      active_chatroom.append(data.message)

      chat_messages = $("#chat_messages")[0]
      if chat_messages
        height = chat_messages.scrollHeight
        $(chat_messages).scrollTop(height)

    else
      chatroom_badge = $("[data-behavior='chatroom-badge'][data-chatroom-id='#{data.chatroom_id}']")
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
          toastr.warning data.username + ' sent a message in ' + data.chatroom_name , 'New Message'

