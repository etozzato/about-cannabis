defmodule AboutCannabis.ArticleView do
  use AboutCannabis.Web, :view

  def render("index.json", %{articles: articles}) do
    %{articles: render_many(articles, AboutCannabis.ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{article: render_one(article, AboutCannabis.ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      title: article.title,
      body: article.body,
      slug: article.slug,
      source: article.source,
      media: article.media,
      author: article.author,
      email: article.email,
      is_draft: article.is_draft,
      is_public: article.is_public}
  end
end
