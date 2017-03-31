class CacheApiResponseService
  def cache_response(params, expiration_policy)
    cache_key = "cache_request:search_for:#{params[:query]}:page-#{params[:page]}"

    Rails.cache.fetch(cache_key, expires_in: expiration_policy) { fetch_products(params) }
  end

  def fetch_products(params)
    api = Semantics3Api.new
    service = ProductSearchService.new(api)
    raw_data = service.get_products(params)
    ConvertDataService.new(raw_data).convert
  end
end
