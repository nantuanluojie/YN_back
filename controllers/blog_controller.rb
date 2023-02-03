namespace '/api/blog' do
helpers Apihelpers
before {inject_params}

post '/add' do
    puts @json_params[:title]
    blog=Blog.new
    blog.title=@json_params[:title]
    blog.content=@json_params[:content]
    blog.save
    # puts blog
    return blog.to_json
end

post '/delete' do
    puts @json_params[:id]
    blog = Blog.find @json_params[:id]
    blog.delete
end

post '/update' do
    blog = Blog.find @json_params[:id]
    blog.update_attributes(title: @json_params[:title],content:@json_params[:content])
    return blog.to_json
end

post '/query' do
    puts @json_params[:id]
    blog=Blog.find @json_params[:id]
    blog.to_json
end

post '/list' do
    Blog.all.skip(@json_params[:page_num]*@json_params[:page_size]).limit(@json_params[:page_size]).to_json
end

end