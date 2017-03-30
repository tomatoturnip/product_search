class CacheApiResponseService
  def self.cache_response(params, expiration_policy)
    cache_key = "cache_request:search_for:#{params[:query]}:page-#{params[:page]}"

    Rails.cache.fetch(cache_key, expires_in: expiration_policy) { yield }
  end
end
