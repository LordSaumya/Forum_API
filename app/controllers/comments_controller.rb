class CommentsController < ApplicationController
    #GET /ForumThreads [Get all threads]
    def index
        @comments = Comments.all
        render json: @comments
    end

    #GET /Comments/:id [Get a specific thread by its ID]
    def show
        @Comment = Comment.find(params[:id])
        render json: @comment
    end

    #POST /Comments [Create a user] 
    def create
        @comment = Comment.new(thread_params)
        if @comment.save
            render json: @comment
        else
            render error: {error: "Error in creating thread"}, status: 400
        end
    end

    #PUT /Comments/:id [Update a thread]
    def update
        @comment = Comment.find(params[:id])
        if @comment
            @comment.update(thread_params)
            render json: {message: "Thread successfully updated"}, status: 200
        else
            render error: {error: "Error in updating user"}, status: 400
        end
    end

    #DELETE /Comments/:id [Delete a comment]
    def destroy
        @comment = Comment.find(params[:id])
        if @comment
            @Comment.destroy
            render json: {message: "Comment successfully deleted"}, status: 200
        else
            render error: {error: "Error in deleting comment"}, status: 400
        end
    end

    private
    def thread_params
        params.require(:Comment).permit(:comment)
    end
end
