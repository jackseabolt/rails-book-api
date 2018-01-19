class BooksController < ApplicationController
    def index 
        @books = Book.all
        render json: @books, status: :ok
    end 

    def create 
        @book = Book.new(book_params)

        @book.save
        render json: @book, status: :created
    end 

    def destroy 
        @book = Book.where(id: params[:id]).first
        if @book.destroy
            head(:ok)
        else 
            head(:unprocessable_entity)
        end 
    end 

    private 

    def book_params
        params.require(:book).permit(:title, :author, :description)
    end 

end
