class Service < ActiveRecord::Base

  before_save :generate_slug

  def run params
    save_sample_params params
    begin
      Runner.new(self, params).run
    rescue => e

    end
  end

  def have_sample_params?
    sample_params.present?
  end

  def save_sample_params params
    self.sample_params = params.to_json
    save
  end

  def test
    run JSON.parse(sample_params, {:symbolize_names => true}) if have_sample_params?
  end

  private
  def generate_slug
    self.slug = title.underscore
  end
end
