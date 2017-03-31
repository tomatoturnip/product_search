class CacheApiRequestJob
  include SuckerPunch::Job

  def perform(params)
    CacheApiResponseService.new.cache_response(params, Semantics3Api::EXPIRATION_POLICY)
  end
end