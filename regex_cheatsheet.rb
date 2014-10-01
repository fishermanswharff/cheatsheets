one_to_two_numbers = /[\d]{1,2}/
four_numbers = /[\d]{4}/


# Credit cards:
def valid_type?
  string = "5424180713039334"
  visa = string.scan(/^4[0-9]{12}(?:[0-9]{3})/).length == 1 ? @card_type = "Visa" : false
  discover = string.scan(/^6(?:011|5[0-9]{2})[0-9]{12}/).length == 1 ? @card_type = "Discover" : false
  master_card = string.scan(/^5[1-5](?:[0-9]{14})/).length == 1 ? @card_type = "MasterCard" : false
  amex = string.scan(/^3[47][0-9]{13}/).length == 1 ? @card_type = "American Express" : false
  all_cards = /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\d{3})\d{11})$/
end

