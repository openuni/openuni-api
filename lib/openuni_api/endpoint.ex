defmodule OpenuniApi.Endpoint do
  use Phoenix.Endpoint, otp_app: :openuni_api

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug OpenuniApi.Router
end
