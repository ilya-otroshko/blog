class PagesController < ApplicationController
    def about
        @heading = 'Страничка о нас'
        @text = 'немного текста'
    end
end
