# frozen_string_literal: true

# Get server data
every 2.minutes do
  rake 'get_server_info'
end
