require 'spec_helper'

describe 'shared_counter' do

  let(:shared_counter) { SharedCounter.new }

  context 'with sleep disabled' do
    it 'sums values up to 100' do
      allow(shared_counter).to receive(:is_asleep).and_return(nil)
      expect{shared_counter.counter}.to change{shared_counter.total}.from(0).to(100)
    end
  end

  context 'with sleep enabled' do
    it 'does NOT sum values up to 100' do
      allow(shared_counter).to receive(:is_asleep).and_return(sleep(rand(0..1)))
      expect(shared_counter.counter).to_not eq(100)
    end
  end
end
