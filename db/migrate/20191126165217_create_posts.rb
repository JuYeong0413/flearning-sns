class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      #t.integer :user_id
      t.belongs_to :user # integer 타입의 user_id가 만들어지고 Post 테이블에 user_id를 색인으로 추가해준다.

      t.timestamps
    end
  end

  #add_index :posts, :user_id # 데이터베이스상 Post라는 테이블에다가 user_id 외래키를 index(색인)에 추가한다.
end
