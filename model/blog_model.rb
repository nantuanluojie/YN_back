class Blog
  include Mongoid::Document
  include Mongoid::Timestamps
  # field :blog_id, type: String
  field :title, type: String 
  field :content, type: String
end