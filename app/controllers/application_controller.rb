class ApplicationController < ActionController::Base

  helper_method :current_user #ヘルパーメソッドを指定し全てのビューからも使えるようにする

  before_action :login_required  #アクションの前にこのメソッドを呼び出すという


  private

  def current_user  #全てのコントローラーからIDを使えるようにする
    @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_url unless current_user
  end

end
