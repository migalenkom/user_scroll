class UserBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user)
    ActionCable.server.broadcast 'user_channel', user: render_user(user), user_id: user._id
  end

  private

  def render_user(user)
    UsersController.renderer.render(partial: 'users/user', locals: { user: user })
  end
end
