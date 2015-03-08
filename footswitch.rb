require 'libdevinput'

dev = DevInput.new "/dev/input/by-id/usb-Kinesis_Footpedal-if01-event-mouse"
dev.each do |event|
  puts "got event #{event}"
end
