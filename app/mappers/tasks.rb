ROM.mappers do
  define(:tasks) do
    model Task
    group :workers, prefix: :workers do
      attribute :id
      attribute :name
      attribute :title
    end
  end
end
