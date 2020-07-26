require 'httparty'
class JettyApi::JettyMxApi
  include HTTParty

  BASE_URL = 'https://jettymx-st.herokuapp.com/api'

  attr_accessor :email, :password, :token

  def initialize(params ={})
    self.email    = params[:email]
    self.password = params[:password]
  end

  def get_token(service)
    url = uri(service)

    response = self.class.post(
      url,
      query:   query,
      headers: { "Content-Type": "application/json" })

      if response.code.eql?(200)
        format_object(response)
      else
        { success: false, response: response }
      end
  end

  def get_trips_by_driver(token, service)
    self.token = token
    url        = uri(service)
    response   = self.class.get(url, query: query,headers: headers)

    if response.code.eql?(200)
      return { success: true, response: response }
    else
      { success: false, response: response }
    end
  end

  private

  def query
    {
      driver: {
        email: email,
        password: password
      }
    }
  end

  def headers
    { 
      "Authorization": "Token #{token}, email=#{email}",
      "Content-Type": "application/json"
    }
  end

  def uri(service)
    "#{BASE_URL}#{service}"
  end

  def format_object(res)
    { success: true, response: build_params(res)}
  end

  def build_params(res)
    {
      id:         res["id"],
      email:      res["email"],
      auth_token: res["auth_token"],
      name:       res["name"],
      last_name:  res["last_name"],
      mobile:     res["mobile"],
      photo:      res["photo"]
    }
  end
end

