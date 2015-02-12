ROM.relation(:tasks) do
  many_to_many :workers, join_table: :tasks_workers, left_key: :task_id, right_key: :worker_id

  # I was imaging this should Just Work, but it gives:
  #
  # ROM.env.read(:tasks).with_workers_not_working1.to_a
  #  => [#<Task id=1
  #             title="Task One"
  #             workers=[{:id=>1, :name=>nil, :title=>"Mrs"}]>,
  #      #<Task id=1
  #             title="Task One"
  #             workers=[{:id=>2, :name=>nil, :title=>"Mr"}]>
  #     ]
  def with_workers_not_working1
    association_join(:workers)
  end

  # This gives the same result as above.
  #
  # ROM.env.read(:tasks).with_workers_not_working2.to_a
  #  => [#<Task id=1
  #             title="Task One"
  #             workers=[{:id=>1, :name=>nil, :title=>"Mrs"}]>,
  #      #<Task id=1
  #             title="Task One"
  #             workers=[{:id=>2, :name=>nil, :title=>"Mr"}]>
  #     ]
  def with_workers_not_working2
    association_join(:workers, select: [:id, :name, :title])
  end

  # Leaving :name out makes it start to work (though, obviously this
  # skips the name column).
  def with_workers_works_a_bit
    association_join(:workers, select: [:id, :title])
  end

  # And finally, this works fine, but requires a few hoops to be jumped through:
  #  1. enumerating all attributes
  #  2. using Sequel magic to rename the name column so it can be used
  #     with the 'prefix' option in the group call in the mapper
  #
  # ROM.env.read(:tasks).with_workers_working.to_a
  #  => [#<Task id=1
  #             title="Task One"
  #             workers=[{:id=>1, :name=>"Worker One", :title=>"Mrs"}, {:id=>2, :name=>"Worker Two", :title=>"Mr"}]>
  #     ]
  def with_workers_working
    association_join(:workers, select: [:id, :name___workers_name, :title])
  end
end
