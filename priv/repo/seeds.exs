# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OpenuniApi.Repo.insert!(%OpenuniApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


OpenuniApi.Repo.insert!(OpenuniApi.User.registration_changeset(%OpenuniApi.User{}, %{
  email: "example@domain.com",
  password: "password",
  confirmed: true,
  confirmation_token: nil
}))
