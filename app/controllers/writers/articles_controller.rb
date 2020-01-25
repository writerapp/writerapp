class Writers::ArticlesController < ApplicationController
  #def keywords
  #end

  def create
    @article = Article.new(article_params)
    @article.writer_id = current_writer.id
    @article.keyword_1 = '髪の毛' #変更予定, spreadsheetから引っ張ってくる
    @article.keyword_2 = Time.new.min #変更予定, spreadsheetから引っ張ってくる
    @article.unit_price = current_writer.unit_price
    @article.save
    redirect_to writers_articles_path
  end

  def index
    @article = Article.new #削除予定
    @articles = Article.where(writer_id: current_writer.id)
  end

  #def show
  #end

  #def edit_headings
  #end

  #def edit
  #end


  private
  def article_params
    params.require(:article).permit(:writer_id, :keyword_1, :keyword_2, :keyword_3, :status, :title, :reference_1, :reference_2, :reference_3, :reference_4, :reference_5, :unit_price)
  end
end
