class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  attr_accessible :content, :action

  paginates_per Kandan::Config.options[:per_page]

  def user_or_deleted_user
  	self.user || User.deleted_user
  end

  def to_message
    # copied from app/models/activity_observer.rb
    faye_channel = "/channels/#{channel.to_param}"
    broadcast_data = attributes.merge({
      :user => user.as_json(:only => [:id, :email, :first_name, :last_name, :gravatar_hash, :active, :locale, :username, :is_admin, :avatar_url]),
      :channel => channel.attributes
    })
    [faye_channel, broadcast_data]
  end

end
