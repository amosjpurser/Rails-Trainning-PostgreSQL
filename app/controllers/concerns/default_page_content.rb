module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end
  def set_page_defaults
    @page_title = "BlogTesting || My testing"
    @seo_keywords = "Amos Purser's portfolios"
  end
end
