```elixir
list = [1, 2, 3, 4, 5]

try do
  Enum.each(list, fn x ->
    if x == 3 do
      Process.exit(self(), :normal)
    end
    IO.puts(x)
  end)
rescue
  e -> IO.puts("An error occurred: #{inspect(e)}")
end

# Or, use Enum.map for a more functional and robust approach:
list = [1,2,3,4,5]
Enum.map(list, fn x ->
  try do 
    if x == 3 do
      raise "Error at 3"
    else
      x
    end
  rescue
    e -> {:error, e}
  end
end)
```