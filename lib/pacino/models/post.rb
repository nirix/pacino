class Post < Sequel::Model
  #many_to_one :user
  
  def validate
    validates_presence :title
    validates_presence :body
  end
  
  def href
    "/" + self.slug + "." + self.id.to_s
  end
  
  #def comments
  #  Comment.where(:commentable_id => self.id).where(:commentable_type => 'Post')
  #end
  
  def before_create
    self.prepare_slug
    self.set_publish_date
  end
  
  def before_save
    self.prepare_slug
  end
  
  def prepare_slug
    self.slug = Rack::Utils.escape(self.title.scan(/\w+/).join('-')).downcase
  end
  
  def set_publish_date
    self.published_at = Time.now
  end
end
