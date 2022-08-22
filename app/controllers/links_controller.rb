class LinksController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update]
    def index
        @links = Link.all
    end
end
