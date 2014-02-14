class Gitlab
  def self.exec params
    url = Slackbot::SLACK_HOOK

    commit_string = params[:total_commits_count] > 1 ? "commits" : "commit"

    commits = params[:commits].map do |commit|
      {
        fallback: "Required text summary of the attachment that is shown by clients that understand attachments but choose not to show them.",

        pretext: "Commit",

        color: "#36a64f",


        fields: [
          {
            title: "#{commit[:message]}",
            value: "<#{commit[:url]}|#{commit[:id]}>",
            short: false
          }
        ]
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
      text: "#{params[:user_name]} push #{params[:total_commits_count]} #{commit_string} to #{params[:repository][:name]}",
      attachments: commits
    }
    opts = {:body => payload.to_json}
    HTTParty.post(url, opts)
  end
end
