defmodule AboutCannabis.ArticleTest do
  use AboutCannabis.ModelCase

  alias AboutCannabis.Article

  @valid_attrs %{author: "some content", body: "some content", email: "some content", is_draft: true, is_public: true, media: "some content", slug: "some content", source: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
