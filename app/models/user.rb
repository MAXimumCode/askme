require 'openssl'
require 'uri'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest.new('SHA256')
  REGEXP_FOR_USERNAME = /\A\w+\z/
  REGEXP_FOR_COLOR = /\A#\h{3}{1,2}\z/
  DEFAULT_COLOR = '#005a55'.freeze
  MAX_LENGTH = 40

  attr_accessor :password

  has_many :questions, dependent: :destroy

  before_validation :make_downcase
  before_save :encrypt_password
  validates :email, :username,
            presence: true
  validates :email, :username,
            uniqueness: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username,
            length: { maximum: MAX_LENGTH },
            format: { with: REGEXP_FOR_USERNAME }
  validates :password,
            presence: true,
            on: :create
  validates :password,
            confirmation: true
  validates :avatar_url,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) },
            allow_blank: true
  validates :color,
            format: { with: REGEXP_FOR_COLOR }

  def self.authenticate(email, password)
    user = find_by(email: email)

    return unless user.present?

    password_hash = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST)
    )

    return unless user.password_hash == password_hash

    user
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack1('H*')
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(password, password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def make_downcase
    username&.downcase!
    email&.downcase!
  end
end
