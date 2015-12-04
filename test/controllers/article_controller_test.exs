defmodule AboutCannabis.ArticleControllerTest do
  use AboutCannabis.ConnCase

  alias AboutCannabis.Article
  @valid_attrs %{author: "some content", body: "some content", email: "some content", is_draft: true, is_public: true, media: "some content", slug: "some content", source: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, article_path(conn, :index)
    assert json_response(conn, 200)["articles"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    article = Repo.insert! %Article{}
    conn = get conn, article_path(conn, :show, article)
    assert json_response(conn, 200)["article"] == %{"id" => article.id,
      "title" => article.title,
      "body" => article.body,
      "slug" => article.slug,
      "source" => article.source,
      "media" => article.media,
      "author" => article.author,
      "email" => article.email,
      "is_draft" => article.is_draft,
      "is_public" => article.is_public}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, article_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, article_path(conn, :create), article: @valid_attrs
    assert json_response(conn, 201)["article"]["id"]
    assert Repo.get_by(Article, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, article_path(conn, :create), article: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    article = Repo.insert! %Article{}
    conn = put conn, article_path(conn, :update, article), article: @valid_attrs
    assert json_response(conn, 200)["article"]["id"]
    assert Repo.get_by(Article, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    article = Repo.insert! %Article{}
    conn = put conn, article_path(conn, :update, article), article: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    article = Repo.insert! %Article{}
    conn = delete conn, article_path(conn, :delete, article)
    assert response(conn, 204)
    refute Repo.get(Article, article.id)
  end
end
