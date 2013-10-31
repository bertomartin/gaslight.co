class CreateExistingBlogAppSchema < ActiveRecord::Migration
  def up

    # posts
    if ActiveRecord::Base.connection.table_exists? 'posts'
      rename_table :posts, :blog_app_posts
    else
      create_table :blog_app_posts, :force => true do |t|
        t.string   "title"
        t.string   "slug"
        t.string   "author"
        t.string   "old_tags"
        t.text     "body"
        t.text     "html"
        t.datetime "published_at"
        t.datetime "created_at",                          null: false
        t.datetime "updated_at",                          null: false
        t.string   "audio_url"
        t.text     "description"
        t.integer  "external_comments_count", default: 0
      end
      add_index :blog_app_posts, :slug
    end

    # alias_tags
    if ActiveRecord::Base.connection.table_exists? 'alias_tags'
      rename_table :alias_tags, :blog_app_alias_tags
    else
      create_table "blog_app_alias_tags", id: false, force: true do |t|
        t.integer "tag_id"
        t.integer "alias_id"
      end
      add_index :blog_app_alias_tags, :tag_id
      add_index :blog_app_alias_tags, :alias_id
    end

    # old_slugs
    if ActiveRecord::Base.connection.table_exists? 'old_slugs'
      rename_table :old_slugs, :blog_app_old_slugs
    else
      create_table "blog_app_old_slugs", force: true do |t|
        t.string   "old_slug"
        t.string   "new_slug"
        t.integer  "post_id"
        t.datetime "created_at"
        t.datetime "updated_at"
      end
      add_index :blog_app_old_slugs, :old_slug
    end

    # taggings
    if ActiveRecord::Base.connection.table_exists? 'taggings'
      # had to specify a name since the default exceeded 63 characters
      rename_index :taggings, 'index_taggings_on_taggable_id_and_taggable_type_and_context', 'index_taggings_on_taggable_id_and_type_and_context'
      rename_table :taggings, :blog_app_taggings
    else
      create_table "blog_app_taggings", force: true do |t|
        t.integer  "tag_id"
        t.integer  "taggable_id"
        t.string   "taggable_type"
        t.integer  "tagger_id"
        t.string   "tagger_type"
        t.string   "context"
        t.datetime "created_at"
      end
      add_index :blog_app_taggings, :tag_id

      # had to specify a name since the default exceeded 63 characters
      add_index :blog_app_taggings, [:taggable_id, :taggable_type, :context], name: "index_blog_app_taggings_on_taggable_id_and_type_and_context"
    end

    # tags
    if ActiveRecord::Base.connection.table_exists? 'tags'
      rename_table :tags, :blog_app_tags
    else
      create_table "blog_app_tags", force: true do |t|
        t.string "name"
      end
    end
  end

  def down
    rename_table :blog_app_posts, :posts
    rename_table :blog_app_alias_tags, :alias_tags
    rename_table :blog_app_old_slugs, :old_slugs
    rename_table :blog_app_taggings, :taggings
    rename_table :blog_app_tags, :tags

    rename_index :taggings, "index_taggings_on_taggable_id_and_type_and_context", "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end
end
