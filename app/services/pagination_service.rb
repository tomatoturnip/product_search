class PaginationService
  attr_reader :params

  LIMIT = 10

  def initialize(params)
    @page = params[:page] || 1
  end

  def get_offset
    return 0 if @page == 1
    (@page.to_i - 1) * LIMIT
  end
end