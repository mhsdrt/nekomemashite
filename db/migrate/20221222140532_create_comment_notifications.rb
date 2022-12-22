class CreateCommentNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_notifications do |t|
      t.integer :comment_id, null: false
      t.integer :visitor_id, null: false #コメントをしたユーザーのID
      t.integer :visited_id, null: false #コメントされたユーザーのID
      t.boolean :checked, null: false, defult: false #通知の確認ステータス
      t.timestamps
    end
  end
end
