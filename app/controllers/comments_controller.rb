class CommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = current_user.comments.new(comment_params)
		comment.book_id = book.id
		if comment.save #入力されたデータをdbに保存する。
	  		redirect_back(fallback_location: book_comments_path)
	  	else
	  		redirect_back(fallback_location: book_comments_path)
	  	end
	end
	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.comments.find_by(book_id: book.id)
		comment.destroy
		redirect_back(fallback_location: book_comments_path)
	end
	private
	def comment_params
	    params.require(:comment).permit(:comment)
	end

end

