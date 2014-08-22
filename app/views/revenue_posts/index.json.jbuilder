json.array!(@revenue_posts) do |revenue_post|
  json.extract! revenue_post, :id, :user_id, :movie_id, :distributor_id, :revenue, :published, :source_url
  json.url revenue_post_url(revenue_post, format: :json)
end
