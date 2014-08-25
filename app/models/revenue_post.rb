class RevenuePost < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user


  delegate :first_name, :to => :user, :prefix => true

  belongs_to :distributor


  def movie_title
    movie.try(:title)
  end

  def movie_title=(title)
    if title.present?
      self.update_attributes( movie_id: Movie.find_or_create_by(title: title).id )
    end
  end

  def revenue_post_params
    params.require(:revenue_post).permit(:user_id, :movie_title, :movie_id, :distributor_id, :revenue, :source_url)
  end

end
