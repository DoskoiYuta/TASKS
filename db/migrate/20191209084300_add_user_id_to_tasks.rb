class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    execute "DELETE FROM tasks;" #SQLから今までのタスクを全消しするクエリ
    add_reference :tasks,:user,null: false,index: true
        #add_referenceはtasksとuserのように二つのテーブルを関連づける時に使うっぽい
        #indexをtrueにするとSQLのソート・検索が早くなる
  end

  def down
    remove_reference :tasks,:user,index: true
  end


end
