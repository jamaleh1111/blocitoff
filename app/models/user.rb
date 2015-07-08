class User < ActiveRecord::Base

  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def num_of_todos
    items.where(completed: nil).count
  end

  # def todos
  #   items.where(completed: nil)
  # end
end
