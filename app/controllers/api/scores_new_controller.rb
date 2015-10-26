class Api::ScoresNewController < Api::ApiController
  skip_before_filter :verify_authenticity_token
  respond_to :json
  before_action :authenticate

  def new
    begin
      map = params[:map].downcase
      mode = Integer(params[:mode])
      player_id = Integer(params[:player_id])
      time = Integer(params[:time])
      name = params[:name]
      match_guid = params[:match_guid]
    rescue NoMethodError, TypeError
      render nothing: true, status: :bad_request
      return false
    end

    if map.blank? || mode.blank? || player_id.blank? || time.blank? || name.blank? || match_guid.blank?
      render nothing: true, status: :bad_request
      return false
    end

    if Score.new_score(map, mode, player_id, time, match_guid, name)
      render nothing: true, status: :ok
    else
      render nothing: true, status: :not_modified
    end
  end
end
