class User < ActiveRecord::Base
  belongs_to :client
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable      

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :roles_mask, :client_id
  
  easy_roles :roles_mask, :method => :bitmask

  # Constant variable storing roles in the system
  # Roles can't be edited, if  if you need to add a new role,
  # just append it to the end of the array
  ROLES_MASK = %w[user admin]
    
  # Get bitmask value of role, useful for where clauses
  def self.role_bitmask(role)
    2**ROLES_MASK.index(role)
  end
end
