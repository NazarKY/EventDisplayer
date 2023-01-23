module EventsHelper
  def humanize_money_amount(amount)
    "$#{number_with_delimiter(amount.to_i, delimiter: ',')}"
  end

  def humanize_place(place)
    place = case place % 10
    when 1 then "#{place}<span class='sequent-end'>ST</span>"
    when 2 then "#{place}<span class='sequent-end'>ND</span>"
    when 3 then "#{place}<span class='sequent-end'>RD</span>"
    else "#{place}<span class='sequent-end'>TH</span>" end

    place.html_safe
  end
end
