json.array!(@agents) do |agent|
  json.extract! agent, :id, :name, :region_id, :neighbour_id, :street, :address, :activity_id, :brief_of_activity, :day_off, :twenty_four, :word1, :word2, :word3, :word4, :word5, :tel1, :tel2, :tel3, :email, :start, :end, :website1, :website2, :can_announce
  json.url agent_url(agent, format: :json)
end
