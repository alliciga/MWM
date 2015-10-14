class API < Grape::API
  version 'v1', using: :header, vendor: 'Alliciga'
  format :json
  prefix :api

  resource :testvm do
    desc "test api"
    get :testapi do
      "test api success."
    end
  end
end
