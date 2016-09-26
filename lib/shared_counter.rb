class SharedCounter

  attr_reader :total

  def initialize
    @total = 0
  end

  def count_to_ten
    (1..10).map do |t|
      Thread.new do |t|
        (1..10).each do
          temp = @total
          sleeping
          temp += 1
          @total = temp
        end
      end
    end.each(&:join)
  end

  def sleeping
    sleep(rand(0..1))
  end
end

shared_counter = SharedCounter.new

shared_counter.count_to_ten
puts shared_counter.total
