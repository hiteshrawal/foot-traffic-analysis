require './room.rb'
require './visit.rb'
require './log_file.rb'


class FootTrafficAnalysis

  attr_accessor :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  def print_report
    puts "\nFoot Traffic Analysis Report\n"
    results = room_visit_info
    order_by_room(results)
  end

  private

  def order_by_room(results)
    results.keys.sort.each do |row|
      puts results[row]
    end
  end

  def room_visit_info
    results = {}
    room_wise_visitors_group.each do |room_id, visit|
      results[room_id.to_i] = Room.new(visit).print_info
    end
    results
  end

  def room_wise_visitors_group
    visitors_log.group_by{|visit| visit.room}
  end

  def visitors_log
    visitors = input_lines.collect do |line|
      data = line.split
      Visit.new(data[0], data[1], data[2], data[3])
    end
    visitors
  end

  def input_lines
    logfile.get_lines
  end

end


traffic_analysis = FootTrafficAnalysis.new(LogFile.new('./input_1.log'))
traffic_analysis.print_report

traffic_analysis.logfile = LogFile.new('./input_2.log')
traffic_analysis.print_report
