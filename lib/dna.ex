defmodule DNA do
  @nucleotide_encoder %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000,
  }

  @nucleotide_decoder Enum.map(@nucleotide_encoder, fn {k, v} -> {v, k} |> Map.new()end)


  def encode_nucleotide(code_point) do
    Map.fetch!(@nucleotide_encoder, code_point)
  end

  def decode_nucleotide(encoded_code) do
    Map.fetch!(@nucleotide_decoder, encoded_code)
  end

  def encode(dna)
  def encode([]), do: <<>>
  def encode([head | tail]) do
    << encode_nucleotide(head)::4, encode(tail)::bitstring>>
  end

  def decode(dna)
  def decode(<<>>), do: []
  def decode(<< head::4, tail::bitstring >>) do
    [decode_nucleotide(head) | decode(tail)]
  end
end
