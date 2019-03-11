# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :document

  validates :title, :description, presence: true
  validate :empty_document

  private

  def empty_document
    errors.add(:document, 'is required') unless document.attached?
  end
end
