# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Document, type: :model do
  context 'Validation' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
  end
end
