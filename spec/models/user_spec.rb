require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:conversations) }

  it { is_expected.to have_many(:topics).through(:conversations) }

  it { is_expected.to have_many(:posts) }
end
