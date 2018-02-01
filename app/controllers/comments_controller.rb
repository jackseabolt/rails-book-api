class CommentsController < ApplicationController

    def create 
        @book = Book.find(params[:post_id])
        @newComment = Comment.new(comment_params)
        newComment.book_id = @book.id
        if newComment.save
            render json: @comment, status :created
        end
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :book_id)
    end

end
