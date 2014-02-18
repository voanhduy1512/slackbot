class Heroku
  def self.exec params
    url = Slackbot::SLACK_HOOK

    comments = params[:git_log].split("\n").map{|line| line.split(':')[1..-1].join}
    attachments = comments.map do |comment|
      {
        color: "#29264d",
        fields: [{
            title: "#{comment}",
            short: false
        }]
      }
    end
    channel = "#{params[:room]}"
    if params[:is_channel]
      channel = "\##{channel}"
    elsif params[:is_person]
      channel = "@#{channel}"
    end
    payload = {
      channel: channel,
      username: "#{params[:botname]}",
      text: "#{params[:user]} deployed version #{params[:release]} of <#{params[:url]}|#{params[:app]}>",
      attachments: attachments
    }
    opts = {:body => payload.to_json}
    HTTParty.post(url, opts)
  end
end
