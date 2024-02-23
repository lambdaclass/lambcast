defmodule Farcaster.Rpc do
  use Tesla

  plug Tesla.Middleware.BaseUrl,
       "https://hub.farcaster.standardcrypto.vc:2281/v1"

  plug Tesla.Middleware.JSON

  def get_request(url_args) do
    {:ok, rsp} = get(url_args)

    rsp.body
  end
end
