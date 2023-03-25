class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_params)
    comment.book_id = book.id
    comment.save
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
  end

  def destroy
    BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
  end

  private

  def book_params
    params.require(:book_comment).permit(:comment)
  end

end
