ROM.commands(:tasks_workers) do

  define(:create) do
    result :many
  end

  define(:update) do
    result :one
  end

  define(:delete) do
    result :one
  end

end
