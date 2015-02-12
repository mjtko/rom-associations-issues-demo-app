class Task
  include Virtus.value_object

  values do
    attribute :id
    attribute :title
    attribute :workers
  end
end
