class CacheApiResponseService
  def self.cache_response(search_term, expiration_policy)
    cache_key = "cache_api_request:search:#{search_term}"

    Rails.cache.fetch(cache_key, expires_in: expiration_policy) { yield }
  end
end
