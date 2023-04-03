defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    rate_before_discount = daily_rate(hourly_rate) * 22
    Float.ceil(apply_discount(rate_before_discount, discount)) |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    per_day = daily_rate(hourly_rate) |> apply_discount(discount)
    Float.floor(budget / per_day, 1)
  end
end

###jbjdjn
