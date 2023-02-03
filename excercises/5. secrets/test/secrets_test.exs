defmodule SecretsTest do
  use ExUnit.Case
  doctest Secrets

  test "Add secret to value" do
    func1 = Secrets.secret_add(4)
    assert func1.(2) === 6
  end

  test "Subtract secret to value" do
    func1 = Secrets.secret_subtract(4)
    assert func1.(2) === -2
  end

  test "Multiply secret to value" do
    func1 = Secrets.secret_multiply(4)
    assert func1.(2) === 8
  end

  test "Divide secret to value" do
    func1 = Secrets.secret_divide(4)
    assert func1.(2) === 0
  end

  test "AND Bitwise check against two value binaries" do
    # 4 -> 00000100
    # 2 -> 00000010
    # Check corresponding bits, if both are true, return true ? false
    # 0 -> 00000000
    func1 = Secrets.secret_and(4)
    assert func1.(2) === 0
  end

  test "XOR Bitwise check against two value binaries" do
    # 4 -> 00000100
    # 2 -> 00000010
    # Check corresponding bits, if one is true and the other is not, return true ? false
    # 6 -> 00000110
    func1 = Secrets.secret_xor(4)
    assert func1.(2) === 6
  end

  test "Combine two secret values, first param to second" do
    func1 = fn value -> value  * 2 end
    func2 = fn value -> value  + 4 end

    invoke_func = Secrets.secret_combine(func1, func2)
    assert invoke_func.(3) === 10
  end
end
