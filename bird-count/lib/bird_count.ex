defmodule BirdCount do
  def today(list) when list == [], do: nil

  def today(list) do
    [todays_count | _counts] = list
    todays_count
  end

  def increment_day_count(list) when list == [], do: [1]

  def increment_day_count(list) do
    [todays_count | counts] = list
    todays_count = todays_count + 1
    [todays_count | counts]
  end

  def has_day_without_birds?(list) do
    cond do
      0 in list -> true
      0 not in list -> false
    end
  end

  def total([]), do: 0

  def total([h | t]), do: h + total(t)

  def busy_days([]), do: 0
  def busy_days([h | t]) when h >= 5, do: 1 + busy_days(t)
  def busy_days([_ | t]), do: busy_days(t)
end
