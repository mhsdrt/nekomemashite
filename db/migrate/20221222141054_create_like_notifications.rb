class CreateLikeNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :like_notifications do |t|
      t.integer :like_id, null: false
      t.integer :visitor_id, null: false #いいねをしたユーザーのID
      t.integer :visited_id, null: false #いいねされたユーザーのID
      t.boolean :checked, null: false, defult: false #通知の確認ステータス
      t.timestamps
    end
  end
end
