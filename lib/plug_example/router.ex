defmodule Router do
  use Plug.Router

  plug Plug.Logger

  plug :match
  plug :dispatch

  get "/error" do
    # When this is uncommented, nothing is logged and a 500 response is sent to
    # the client.
    # raise Plug.Parsers.BadEncodingError, message: "Bad encoding!"

    # When this is uncommented, a stack trace is logged and a 500 response is
    # sent to the client.
    # raise "Something went wrong"

    # Not going to get here
    send_resp(conn, 200, "OK")
  end

  get "/" do
    send_resp(conn, 200, "OK")
  end
end
