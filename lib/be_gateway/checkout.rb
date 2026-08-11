module BeGateway
  class Checkout
    include Connection

    def get_token(params)
      params[:version] ||= params['version'] || '2.1'
      send_request('post', '/ctp/api/checkouts', checkout: params)
    end

    def query(token)
      send_request('get', "/ctp/api/checkouts/#{token}")
    end

    def delete_credit_card(token)
      send_request('delete', "/ctp/api/credit_cards/#{token}")
    end
  end
end
