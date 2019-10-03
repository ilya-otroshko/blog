class SearchController < ApplicationController
    def search
        if params[:term].nil?
        @post = []

        else
          @post = Post.search params[:term]
        end
      end
end
