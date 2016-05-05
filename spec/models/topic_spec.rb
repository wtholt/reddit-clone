require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { is_expected.to have_many(:conversations) }

  it { is_expected.to have_many(:users).through(:conversations) }

  it { is_expected.to have_many(:posts) }
end
