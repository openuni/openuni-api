defmodule OpenuniApi.SessionTest do
  use OpenuniApi.ModelCase

  alias OpenuniApi.Session

  @valid_attrs %{user_id: "12345"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Session.changeset(%Session{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "update changeset with valid attributes" do
    changeset = Session.registration_changeset(%Session{}, @valid_attrs)
    assert changeset.changes.token
    assert changeset.valid?
  end

  test "update changeset with invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end
end
