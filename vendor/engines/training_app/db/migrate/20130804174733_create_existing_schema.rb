class CreateExistingSchema < ActiveRecord::Migration
  def change
    create_table "training_app_courses", :force => true do |t|
      t.string   "title"
      t.text     "description_main"
      t.text     "description_close"
      t.date     "start_date"
      t.date     "end_date"
      t.integer  "price"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "venue_id"
    end

    create_table "training_app_courses_trainers", :id => false, :force => true do |t|
      t.integer "course_id"
      t.integer "trainer_id"
    end

    create_table "training_app_discount_requests", :force => true do |t|
      t.integer  "price"
      t.text     "reason"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "training_app_registrations", :force => true do |t|
      t.integer  "amount"
      t.string   "stripe_token"
      t.string   "name"
      t.string   "email"
      t.string   "organization"
      t.string   "phone"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "customer_id"
      t.integer  "workshop_id"
      t.string   "referral_token"
      t.string   "code"
    end

    create_table "training_app_trainers", :force => true do |t|
      t.string   "name"
      t.string   "gravatar_email"
      t.text     "bio"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "training_app_venues", :force => true do |t|
      t.string   "name"
      t.string   "address"
      t.text     "blurb"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "city"
    end

    create_table "training_app_workshops", :force => true do |t|
      t.integer  "venue_id"
      t.integer  "course_id"
      t.integer  "price"
      t.date     "start_date"
      t.date     "end_date"
      t.integer  "capacity"
      t.integer  "early_bird_price"
      t.datetime "early_bird_end_date"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "current"
      t.string   "registration_link"
    end
  end
end
