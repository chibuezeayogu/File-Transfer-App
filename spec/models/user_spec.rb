# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validates callback function' do
    it { is_expected.to callback(:downcase_email).before(:validation) }
  end

  context 'Validation' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :password_confirmation }
  end
end
