class SharedCounter

  attr_accessor :total

  def initialize
    @total = 0
  end

  def counter
    (1..10).map do |t|
      Thread.new do |t|
        (1..10).each do
          temp = @total
          # is_asleep
          temp += 1
          @total = temp
        end
      end
    end.each(&:join)
  end

  def is_asleep
    sleep(rand(0..1))
  end
end

# shared_counter = SharedCounter.new

# shared_counter.counter
# puts shared_counter.total

