
class DojoWeb < Sinatra::Base

  set :root, 'lib/dojo_web'

  get "*" do
    erb :index
  end

end