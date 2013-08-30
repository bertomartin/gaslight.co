ActiveAdmin.register Post do
  menu label: 'Posts', parent: 'Blog'
  config.sort_order = 'published_at_desc'

  controller do
    defaults finder: :find_by_slug

    def new
      @post = Post.new(published_at: Time.now)
      new!
    end

    def create
      munge_tag_list
      create!
    end

    def update
      munge_tag_list
      update!
    end

    def munge_tag_list
      params[:post][:tag_list] = params[:tag_list_string]
    end

    def permitted_params
      params.permit(post: [:title, :body, :author, :audio_url, :slug, :tag_list, :published_at, :description])
    end
  end

  index do
    selectable_column
    column :id
    column(:title) { |p| link_to(p.title, p) }
    column :author
    column('Published?') { |p| p.published? ? 'Yes' : 'No' }
    column(:published_at, sortable: :published_at) { |p| l(p.published_at, format: :nice) unless p.published_at.nil? }
    default_actions
  end

  show do |post|
    attributes_table do
      row :id
      row :title
      row :author
      row(:html) { raw post.html }
      row :to_param
      row :tag_list
      row('Published?') { |p| p.published? ? 'Yes' : 'No' }
      row :published_at
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form partial: 'posts/form'

end

