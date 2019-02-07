module ApplicationHelper
  def current_year
    "#{Time.now.year.to_i}."
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end
end
