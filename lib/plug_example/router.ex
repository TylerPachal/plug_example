defmodule Router do
  use Plug.Router

  plug Plug.Logger

  plug :match
  plug :dispatch

  get "/regular_error" do
    # A stack trace is logged and a 500 response is sent to the client.
    raise "Something went wrong"

    # Not going to get here
    send_resp(conn, 200, "OK")
  end

  get "/plug_error" do
    # Nothing is logged and a 500 response is sent to the client.  Why is
    # nothing logged?
    raise Plug.Parsers.BadEncodingError, message: "Bad encoding!"

    # Not going to get here
    send_resp(conn, 200, "OK")
  end

  get "/" do
    send_resp(conn, 200, "OK")
  end
end
