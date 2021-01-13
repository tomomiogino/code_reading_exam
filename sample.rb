require 'slack-notify'
require 'clockwork'
require 'active_support/time'
require 'dotenv'
Dotenv.load

module Clockwork
  sample = SlackNotify::Client.new(webhook_url: ENV['WEBHOOK'])

  handler do |job|
    sample.notify(job)
  end

  every(3.minutes, '3分ごとのメッセージ')
end