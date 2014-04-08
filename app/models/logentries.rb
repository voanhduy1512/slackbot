class Logentries
  def self.exec params
    url = Slackbot::SLACK_HOOK
    raw_payload = JSON.parse(params[:payload]).with_indifferent_access
    attachments = [
      {
        color: "#29264d",
        fields: [{
            title: "#{raw_payload[:event][:m]}",
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

    if channel.blank?
      channel = "cems-discussion"
    end

    payload = {
      channel: channel,
      text: "#{raw_payload[:alert][:name]}",
      attachments: attachments
    }
    opts = {:body => payload.to_json}
    HTTParty.post(url, opts)
  end
end
