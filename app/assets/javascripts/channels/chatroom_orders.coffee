App.chatroom_orders = App.cable.subscriptions.create "ChatroomOrdersChannel",
  connected: ->
    console.log 'chika-minute!'

  disconnected: ->
    console.log 'chatroom disconnected'

  received: (data) ->
    console.log 'message received'
    $("#new_message")[0].reset()
    active_chatroom = $("[data-behavior='chatroom-orders'][data-chatroom-id='#{data.chatroom_id}']")
    chatbox = $("[data-behavior='chatbox'][data-chatroom-id='#{data.chatroom_id}']")
    
    if active_chatroom.length > 0
      active_chatroom.append(data.message)

      chat_messages = $("#chat_messages")[0]
      if chat_messages
        height = chat_messages.scrollHeight
        $(chat_messages).scrollTop(height)
    else if chatbox.length > 0
      chatbox.append(data.message)

      chat_messages = $("#chat_messages")[0]
      if chat_messages
        height = chat_messages.scrollHeight
        $(chat_messages).scrollTop(height)
    else
        toastr.options =
        closeButton: true
        progressBar: true
        onclick: ->
          window.location.replace "/chatroom_orders/#{data.chatroom_id}/messages/#{data.chatroom_id}"
          return
        showMethod: 'slideDown'
        positionClass: 'toast-bottom-left'
        timeOut: 7000
        toastr.warning data.username + ' sent a message in ' + data.chatroom_name , 'New Message'

