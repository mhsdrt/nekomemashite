class Public::SearchesController < ApplicationController

  def search
    @type = params["type"]
    @content = params["content"]
    method = params["method"]
    @records = search_for(@type, @content, method)
    #byebug
  end

  private
  def search_for(type, content, method)
    
    if type == 'keyword'
      if method == 'perfect'
        ret = Post.where(content: content)
      else
        ret = Post.where('content LIKE ?', '%'+content+'%')
      end

    end
    
    if type == 'tag'
      if method == 'perfect'
        ret = Post.where(tag: content)
      else
        ret = Post.where('tag LIKE ?', '%'+content+'%')
      end
    end
    
    return ret 
  end
end
