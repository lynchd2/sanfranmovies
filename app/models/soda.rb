require 'soda/client'


class Soda
  attr_reader :client, :mechanize

  def initialize
    @client = SODA::Client.new({:domain => "data.sfgov.org", :app_token => "oxIaSRfUvc6ioOslIXneYkiVx"})
    Tmdb::Api.key("066f3cdd124c632840cc0694e49d3662")
    @mechanize = Mechanize.new
  end

  def movies_with_address(address)
    return "Nothing there" if address == nil
    client.get("wwmu-gmzc", {
      "$where" => "lower(locations) like '%#{address.downcase}%'"
      })
  end

end


