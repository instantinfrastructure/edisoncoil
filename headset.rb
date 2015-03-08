require 'libdevinput'

dev = DevInput.new "/dev/input/by-id/usb-Plantronics_Wireless_Audio_Plantronics_Wireless_Audio-event-if03"
dev.each do |event|
  puts "got event #{event}"
end
