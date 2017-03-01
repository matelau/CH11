defmodule CH11Test do
  use ExUnit.Case
  doctest CH11

  # https://hexdocs.pm/elixir/String.html

  IO.puts("Word")
  IO.puts('chars')
  IO.puts("""
          Lots
          of
          Words
          """)
  IO.puts("\n")

  # Sigils
  IO.puts("Sigils\n")
  IO.puts(~C[charater_list\n])
  IO.puts(~c[escaped_char_list\n])
  IO.puts(~D<2017-03-01>)
  IO.puts(~S(this is a string\n))
  IO.puts(~s(this is an escaped string\n))
  Enum.each(~w[my dogs name is iroh]s, fn(a) -> IO.puts(a) end)
  IO.puts("\n")

  # Binaries
  IO.puts("Binary\n")
  IO.puts(<<104, 101, 108, 108, 111>> == "hello")
  IO.inspect(<< 2.5 :: float >>)
  IO.puts(<< 2.5 :: float >>)
  IO.puts("\n")

  test "convert the following to a binary" do
    char_list = 'char_list'
    assert IO.inspect(is_binary(char_list))
    char_list2 = [99, 104, 97, 114, 95, 108, 105, 115, 116]
    assert IO.inspect(is_binary(char_list2))
  end

  test "convert the following to a character list using sigils" do
    string = "char_list"
    assert IO.inspect(is_list(string))
  end

  test "convert the following to a list of strings using sigils" do
    string = "whitespace delimited words"
    assert IO.inspect(is_list(string))
    Enum.each(string, fn(w) -> assert is_binary(IO.inspect(w)) end)
    string = "~w[whitespace delimited words]a"
    assert IO.inspect(is_list(string))
    Enum.each(string, fn(w) -> assert is_atom(IO.inspect(w)) end)
  end
end
