class Writers::ArticlesController < ApplicationController
  before_action :authenticate_writer!

  #def keyword
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
    @q = Article.ransack(params[:q])
    if params[:q].present?
      @articles = @q.result(distinct: true).where(writer_id: current_writer.id)
      render :index
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit_heading
    @article = Article.find(params[:id])
    unless @article.status == 'edit_heading'
      flash.now[:danger] = 'この記事の見出しは編集できません'
      render 'show'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to writers_article_path(@article)
    else
      render 'edit_heading'
    end
  end

  def apply_heading
    @article = Article.find(params[:id])
    if @article.valid?(:apply_heading)
      @article.status = 1
      @article.save
      redirect_to writers_article_path(@article), notice: "見出しを申請しました"
    else
      render 'show'
    end
  end

  def edit
    @article = Article.find(params[:id])
    unless @article.status == 'edit'
      flash.now[:danger] = 'この記事の本文は編集できません'
      render 'show'
    end
  end

  def apply
    @article = Article.find(params[:id])
    if @article.valid? (:apply)
      @article.status = 3
      @article.save
      redirect_to writers_article_path(@article), notice: "記事を申請しました"
    else
      render 'show'
    end
  end

  private
  def article_params
    params.require(:article).permit(:writer_id, :keyword_1, :keyword_2, :keyword_3, :status, :title, :reference_1, :reference_2, :reference_3, :reference_4, :reference_5, :unit_price,
      headings_attributes: [:id, :title, :body, :_destroy,
        subheadings_attributes: [:id, :title, :body, :_destroy,
          subsubheadings_attributes: [:id, :title, :body, :_destroy]
        ]])
  end
end
