require 'rails_helper'

RSpec.describe Article, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it {shoulda validate_presence_of(:title)}
  it {shoulda validate_presence_of(:content)}
end
