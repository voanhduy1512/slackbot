class Service < ActiveRecord::Base
  def run params
    save_sample_params params unless have_sample_params?
    run_code
  end

  def have_sample_params?
    sample_params.present?
  end

  def save_sample_params params
    self.sample_params = params.to_s
    save
  end

  private
  def run_code
    result = true
    begin
      eval(code)
    rescue => e
      result = false
    end
    result
  end
end
