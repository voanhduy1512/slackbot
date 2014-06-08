class Runner
  attr_reader :service, :params

  def initialize service, params
    @service = service
    @params = params
    instance_eval(@service.helper_methods)
  end

  def channel
    if params[:is_channel]
      "\##{params[:room]}"
    elsif params[:is_person]
      "@#{params[:room]}"
    else
      params[:room]
    end
  end

  def text
    eval(@service.text)
  end

  def attachments
    eval(@service.attachments)
  end

  def payload
    payload = {
      channel: channel,
      text: text,
      attachments: attachments
    }
  end

  def run
    opts = {:body => payload.to_json}
    HTTParty.post(Slackbot::SLACK_HOOK, opts)
  end
end
