class Client < ActiveRecord::Base
  has_many :users

  def unique_key(len)
    SecureRandom.base64(len).tr('+/=lIO0', 'pqrsxyz')
  end
end
