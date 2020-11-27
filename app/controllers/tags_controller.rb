class TagsController < ApplicationController
    def index
      render json: { tags: Story.tag_counts.most_used.map(&:name) }
    end
end