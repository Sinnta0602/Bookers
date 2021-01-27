class BooksController < ApplicationController

  def new
     @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    
   if @book.save
      flash[:success] = "Book was successfully created."
    redirect_to book_path(@book.id)# , notice: 'メッセージが送信されました'
   else
    @books = Book.all
    # flash[:notice] = "Book was successfully 失敗しました."
    # flash.now[:alert] = 'メッセージを入力してください。'
    render :index
   end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book= Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
   if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
    # flash[:success] = "Book was successfully updated."
    
   else
    render :edit
    # flash.now[:alert] = 'メッセージを入力してください。'
    # redirect_to edit_book_path
    # @books = Book.all
    # flash[:danger] = "更新に失敗しました。"
   end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to books_path# , notice: 'メッセージが送信されました'
    
  # # if 
  # # else
  # #   flash.now[:alert] = 'メッセージを入力してください。'
  # #   render :index
  # end
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end