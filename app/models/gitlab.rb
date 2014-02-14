class Gitlab
  def self.exec params
    url = Slackbot::SLACK_HOOK

    commit_string = params[:total_commits_count] > 1 ? "commits" : "commit"

    attachments = params[:commits].map do |commit|
      {
        color: "good",
        fields: [{
            title: "#{commit[:message]}",
            value: "<#{commit[:url]}|#{commit[:id][0..9]}>",
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
    branch = params[:ref][params[:ref] =~ /[^\/]+$/..-1]
    branch_url = "#{params[:repository][:homepage]}/commits/#{branch}"
    payload = {
      channel: channel,
      username: "#{params[:botname]}",
      text: "#{params[:user_name]} pushes #{params[:total_commits_count]} #{commit_string} to <#{branch_url}|#{branch}> on <#{params[:repository][:homepage]}|#{params[:repository][:name]}>",
      attachments: attachments
    }
    opts = {:body => payload.to_json}
    HTTParty.post(url, opts)
  end
end
