App.users = App.cable.subscriptions.create("UserChannel", {
  connected: function() {
  },
  disconnected: function() {
  },
  received: function(data) {
    let selector = '#' + data['user_id'].$oid;
    console.log(selector)
    if ($(selector).size() > 0)
      $('#' + data['user_id'].$oid).replaceWith(data['user']);
    else
      $('#users').append(data['user']);

  }
});
