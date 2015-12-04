defmodule AboutCannabis.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :body, :text
      add :slug, :string
      add :source, :string
      add :media, :string
      add :author, :string
      add :email, :string
      add :is_draft, :boolean, default: false
      add :is_public, :boolean, default: false

      timestamps
    end

  end
end
