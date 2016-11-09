defmodule OpenuniApi.Session do
  use Phoenix.Controller
  use OpenuniApi.Web, :model

  schema "sessions" do
    field :token, :string
    belongs_to :user, OpenuniApi.User

    timestamps
  end

  @required_fields ~w(user_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
      |> cast(params, @required_fields, @optional_fields)
  end

  def registration_changeset(model, params \\ :empty) do
    model
      |> changeset(params)
      |> put_change(:token, SecureRandom.urlsafe_base64())
  end

  def get_session(conn) do
    case get_req_header(conn, "x-openuni-user.token") do
      [token] ->
          OpenuniApi.Repo.get_by(OpenuniApi.Session, token: token)
      _ ->
        nil
    end
  end
end
