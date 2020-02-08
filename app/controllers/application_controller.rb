class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  #herokuapp.comから独自ドメインへリダイレクト
  before_filter :ensure_domain
  FQDN = '.ohanami.work'
 
  # redirect correct server from herokuapp domain for SEO
  def ensure_domain
   return unless /\.herokuapp.com/ =~ request.host
   
   # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める 
   port = ":#{request.port}" unless [80, 443].include?(request.port)
   redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to root_url
    end
  end
  
  def counts(review)
    @count_likes = review.likes.count
  end
end
