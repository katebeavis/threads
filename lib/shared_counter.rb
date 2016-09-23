class SharedCounter

  attr_accessor :total

  def initialize
    @total = 0
  end
end

shared_counter = SharedCounter.new

threads = 10.times.map do |t|
  Thread.new(t) do |t|
    10.times do
      temp = shared_counter.total
      # sleep(0.1)
      temp += 1
      shared_counter.total = temp
    end
  end
end

threads.each { |t| t.join }
puts shared_counter.total

