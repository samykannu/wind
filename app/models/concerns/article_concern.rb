require 'active_support/concern'
module ArticleConcern
  include ActiveSupport::Concern
  def active_man
    self.published?
  end
end
