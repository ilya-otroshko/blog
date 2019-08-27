class PagesController < ApplicationController
    def about
        @heading = 'Page about us'
        @text = 'some text'
    end
end
