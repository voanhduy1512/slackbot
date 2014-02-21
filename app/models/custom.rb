class Heroku
  def self.exec params
    url = Slackbot::SLACK_HOOK

    channel = "#{params[:room]}"
    if params[:is_channel]
      channel = "\##{channel}"
    elsif params[:is_person]
      channel = "@#{channel}"
    end
    payload = {
      channel: channel,
      username: "#{params[:botname]}",
      text: "#{params[:text]}"
    }
    opts = {:body => payload.to_json}
    HTTParty.post(url, opts)
  end
end
