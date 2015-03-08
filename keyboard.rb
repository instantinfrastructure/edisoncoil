require 'libdevinput'

dev = DevInput.new "/dev/input/by-id/usb-05f3_0007-event-kbd"
dev.each do |event|
  puts "got event #{event}"
end
