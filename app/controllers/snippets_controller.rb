class SnippetsController < ApplicationController
  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    if @snippet.save
      @client ||= IronWorkerNG::Client.new(:token => ENV["TOKEN"], :project_id => ENV["PROJECT_ID"])
      @client.tasks.create("pygments",
                           "database" => Rails.configuration.database_configuration[Rails.env],
                           "request" => {"lang" => @snippet.language,
                                         "code" => @snippet.plain_code},
                           "snippet_id" => @snippet.id)
      redirect_to @snippet
    else
      render :new
    end
  end

  private
  def snippet_params
    params.require(:snippet).permit(:language, :plain_code)
  end
end
