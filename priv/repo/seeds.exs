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


user = OpenuniApi.Repo.insert!(OpenuniApi.User.registration_changeset(%OpenuniApi.User{}, %{
  confirmed: true,
  email: "email@domain.com",
  password: "s3cr3t"
}))

OpenuniApi.Email.confirmation_html_email(%{
  email: user.email,
  token: user.confirmation_token
}) |> OpenuniApi.Mailer.deliver_now
