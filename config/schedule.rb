set :output, "#{path}/log/cron_log.log"

every 6.hours do
  runner "UpdateTwitterData.update", environment: 'development'
end