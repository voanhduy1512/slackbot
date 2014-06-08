class Service < ActiveRecord::Base

  before_save :generate_slug

  def run params
    save_sample_params params unless have_sample_params?
    Runner.new(self, params).run
  end

  def have_sample_params?
    sample_params.present?
  end

  def save_sample_params params
    self.sample_params = params.to_json
    save
  end

  private
  def generate_slug
    self.slug = title.underscore
  end
end
