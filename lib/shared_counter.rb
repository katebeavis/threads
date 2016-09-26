class SharedCounter

  attr_accessor :total

  def initialize
    @total = 0
  end

  def counter
    10.times.map do |t|
      Thread.new do |t|
        10.times do
          temp = @total
          is_asleep
          temp += 1
          @total = temp
        end
      end
    end
  end

  def sum_threads
    self.counter.each { |t| t.join }
  end

  def is_asleep
    sleep(rand(0..1))
  end
end

shared_counter = SharedCounter.new

shared_counter.sum_threads
puts shared_counter.total

