class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User',
                      optional: true
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags, source: :tag
  validates :text,
            presence: true
  validates :text,
            length: { maximum: 255 }

  after_save :find_tags

  def find_tags
    QuestionTag.where(question: id).destroy_all

    ("#{text}!#{answer}").downcase.scan(/#[[:word:]-]+/i).uniq.each do |tag_name|
      tags << Tag.where(name: tag_name).first_or_create!
    end
  end
end
