json.array!(@visit_logs) do |visit_log|
  json.extract! visit_log, :id, :spot_id, :weather, :group_kind, :integer, :season, :integer
  json.url visit_log_url(visit_log, format: :json)
end
