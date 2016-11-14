class Visit
  attr_accessor :visitor, :room, :status, :time

  def initialize(visitor, room, status, time)
    @visitor = visitor 
    @room = room
    @status = status
    @time = time.to_i
  end

end
