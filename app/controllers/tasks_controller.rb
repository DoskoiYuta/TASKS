class TasksController < ApplicationController

  #フィルターを使うことで同じコードを繰り返し書かなくて済む
  before_action :set_task, only: [:show,:edit,:update,:destroy]

  def index
    @tasks=current_user.tasks.order(created_at: :desc)  #ログイン中のユーザーのタスクのみ取得
                                                        #current_user.tasks.recentでもいい(recentはモデル内で自作した関数)
    #index.html.slimにレンダーする
  end

  def show
    #show.html.slimにレンダーする
  end

  def new
    @task=Task.new
    #new.html.slimにレンダーする
  end

  def edit
    #edit.html.slimにレンダーする
  end

####################################################

  def create
    #task = Task.new(task_params)
    #task.save!
    #redirect_to tasks_url,notice: "タスク「#{task.name}」を登録しました。"
    ##tasks_url(ヘルパー,index.html.slim行)にリダイレクトする(create.html.slimにはレンダーしない)

    #nameが空だった時に再入力させるバージョン
    @task=current_user.tasks.new(task_params)  #インスタンス変数@taskにデータを入れることで、newの画面に戻ってもデータが入力済みの状態にする
                                               #current_userでログイン中のユーザーを取得。そのユーザーが持ってるtaskモデルにタスクを

    if @task.save    #データ検証の結果がfalseだった場合に例外を発生させないためにsaveメソッドを使う
      redirect_to @task,notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end

  end

  def update
    task.update!(task_params)
    redirect_to tasks_url,notice: "タスク「#{task.name}」を更新しました。"
    #tasks_url(ヘルパー,index.html.slim行)にリダイレクトする(update.html.slimにはレンダーしない)
  end

  def destroy
    task.destroy
    redirect_to tasks_url ,notice: "タスク「#{task.name}」を削除しました。"
  end

private
  def task_params
    params.require(:task).permit(:name,:description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end


end
