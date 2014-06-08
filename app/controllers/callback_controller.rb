class CallbackController < ApplicationController
  def index
    service = Service.find_by(:slug => params[:service])
    result = 'Something went wrong'
    if service && service.run(params)
      result = 'success'
    end

    render text: result
  end

  def gitlab
    Gitlab.exec params
    render text: 'success'
  end

  def heroku
    Heroku.exec params
    render text: 'success'
  end

  def logentries
    Logentries.exec params
    render text: 'success'
  end

  def custom
    Custom.exec params
    render text: 'success'
  end
end
