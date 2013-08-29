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
      uri = URI.parse("http://pygments.appspot.com/")
      request = Net::HTTP.post_form(uri, lang: @snippet.language, code: @snippet.plain_code)
      @snippet.update_attribute(:highlighted_code, request.body)
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
