class Logentries
  def self.exec params
    url = Slackbot::SLACK_HOOK

    attachments = [
      {
        color: "#29264d",
        fields: [{
            title: "#{params[:event][:m]}",
            short: false
        }]
      }
    ]
    channel = "#{params[:room]}"
    if params[:is_channel]
      channel = "\##{channel}"
    elsif params[:is_person]
      channel = "@#{channel}"
    end
    payload = {
      channel: channel,
      text: "#{params[:alert][:name]}",
      attachments: attachments
    }
    opts = {:body => payload.to_json}
    HTTParty.post(url, opts)
  end
end