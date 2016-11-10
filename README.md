# OpenuniApi

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Run seed files `mix run priv/repo/seeds.exs`
  * Start Phoenix endpoint with `mix phoenix.server`

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

##  envrc

an SMTP server is required to send emails, I'm using [FakeSMTP](https://nilhcem.github.io/FakeSMTP/)

```bash
export SMTP_SERVER="localhost"
export SMTP_PORT=1025
export SMTP_USERNAME=""
export SMTP_PASSWORD=""
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
