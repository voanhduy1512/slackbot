class CallbackController < ApplicationController
  def gitlab
    Gitlab.exec params
    render text: 'success'
  end

  def heroku
    Heroku.exec params
    render text: 'success'
  end
end
