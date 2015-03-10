#!/usr/local/bin/ruby
require 'libdevinput'

#dev = DevInput.new "
#dev = DevInput.new "/dev
unless ARGV[0]
  %w{
/dev/input/by-id/usb-05f3_0007-event-kbd
/dev/input/by-id/usb-Plantronics_Wireless_Audio_Plantronics_Wireless_Audio-event-if03
/dev/input/by-id/usb-Kinesis_Footpedal-if01-event-mouse
}.each do |device|
    begin
      IO.popen("#{__FILE__} #{device}")
    end
  end
  sleep 10000 while true
  quit
end

device = ARGV[0] || "/dev/input/by-id/usb-05f3_0007-event-kbd"
$drumloop = nil

def playloop(filename)
  if $drumloop
    Process.kill('KILL', $drumloop.pid)
    $druploop = nil
  end
  return unless filename
  $drumloop = IO.popen("mplayer #{filename} -loop 99")
end

dev = DevInput.new device
dev.each do |event|
  if event.type_str == 'Key' and event.value_str == 'Press'
    case event.code_str
    when '0'
      playloop nil
    when '1'
      playloop "drums/01_loop.wav"
    when '2'
      playloop "drums/02_loop.wav"
    when '3'
      playloop "drums/03_loop.wav"
    when '4'
      playloop "drums/04_loop.wav"
    when '5'
      playloop "drums/05_loop.wav"
    when '6'
      playloop "drums/06_loop.wav"
    when '7'
      playloop "drums/07_loop.wav"
    when '8'
      playloop "drums/08_loop.wav"
    when 'A'
      IO.popen('mplayer plucks/48_C3.wav')
    when 'Apostrophe'
      IO.popen('mplayer plucks/49_C3s.wav')
    when 'O'
      IO.popen('mplayer plucks/50_D3.wav')
    when 'Comma'
      IO.popen('mplayer plucks/51_D3s.wav')
    when 'E'
      IO.popen('mplayer plucks/52_E3.wav')
    when 'U'
      IO.popen('mplayer plucks/53_F3.wav')
    when 'P'
      IO.popen('mplayer plucks/54_F3s.wav')
    when 'I'
      IO.popen('mplayer plucks/55_G3.wav')
    when 'Y'
      IO.popen('mplayer plucks/56_G3s.wav')
    when 'D'
      IO.popen('mplayer plucks/57_A3.wav')
    when 'F'
      IO.popen('mplayer plucks/58_A3s.wav')
    when 'H'
      IO.popen('mplayer plucks/59_B3.wav')
    when 'T'
      IO.popen('mplayer plucks/60_C4.wav')
    when 'C'
      IO.popen('mplayer plucks/61_C4s.wav')
    when 'N'
      IO.popen('mplayer plucks/62_D4.wav')
    when 'R'
      IO.popen('mplayer plucks/63_D4s.wav')
    when 'S'
      IO.popen('mplayer plucks/64_E4.wav')
    when 'BackSlash'
      IO.popen('mplayer plucks/65_F4.wav')
    when 'Slash'
      IO.popen('mplayer plucks/66_F4s.wav')
    when 'RightCtrl', 'LeftControl'
      IO.popen('mplayer drums/12_snare.wav')
    when 'RightMeta', 'LeftAlt'
      IO.popen('mplayer drums/13_snare.wav')
    when 'LeftShift', 'RightShift'
      IO.popen('mplayer drums/14_perc.wav')
    when 'RightMeta', 'LeftMeta'
      IO.popen('mplayer drums/15_perc.wav')
    when 'Tab', 'Enter'
      IO.popen('mplayer drums/16_perc.wav')
    when 'Space', 'Backspace'
      IO.popen('mplayer drums/17_perc.wav')
    when 'VolumeUp'
      p event.code_str
    when 'VolumeDown'
      p event.code_str
    when 'NextSong'
      p event.code_str
    when 'PlayPause'
      p event.code_str
    when 'LeftBtn'
      IO.popen('mplayer drums/11_snare.wav')
    when 'MiddleBtn'
      IO.popen('mplayer drums/09_kick.wav')
    when 'RightBtn'
      IO.popen('mplayer drums/10_kick.wav')
    else
      puts "got event #{event}"
      puts <<-EOF
  #{event.time}: A Time object of the event time
  #{event.tv_sec}: An Integer with the number of seconds since epoch
  #{event.tv_usec}: An Integer with the sub-seconds value in milliseconds
  #{event.type}: An Integer with the type code
  #{event.type_str}: A String representation of the type if available
  #{event.code}: An Integer with the event code
  #{event.code_str}: A String representation of the code if available
  #{event.value}: An Integer with the event value
  #{event.value_str}: A String representation of the value if available
EOF
    #binding.pry
    end
  end
end

