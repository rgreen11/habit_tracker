class HardWorkerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Doing hard work with #{args.inspect}"
    # Example work: simulate delay
    sleep 5
    puts "Done!"
  end
end