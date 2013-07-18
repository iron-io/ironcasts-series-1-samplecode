module IronManager
  extend self
  def iw_client
    IronWorkerNG::Client.new(:token => ENV["IRON_TOKEN"], :project_id => ENV["IRON_PROJECT_ID"])
  end
end

