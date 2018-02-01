class CommentsController < ApplicationController

    def create 
        @book = Book.find(params[:post_id])
        @newComment = Comment.new(comment_params)
        @newComment.book_id = @book.id
        @newComment.save
        render json: @newComment, status :created
        
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :book_id)
    end

end
