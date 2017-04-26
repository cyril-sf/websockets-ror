class WebsocketsController < FayeRails::Controller
  observe Release, :after_create do |new_release|
    WebsocketsController.publish('/releases', new_release.attributes)
  end

  channel '/releases' do
    monitor :subscribe do
      puts "Client #{client_id} subscribed to #{channel}."
    end
    monitor :unsubscribe do
      puts "Client #{client_id} unsubscribed from #{channel}."
    end
    monitor :publish do
      puts "Client #{client_id} published #{data.inspect} to #{channel}."
    end
  end
end
