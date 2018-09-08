def pet_shop_name(pet_shop)     #(passing in arguement) which we wanna return
  return pet_shop[:name]    #returns the pet shop in the directorie of name
end

def total_cash(cash)
  return cash[:admin][:total_cash]
end

# def add_or_remove_cash(pet_shop, amount)  #call the arguements relevant to test
#   pet_shop[:admin][:total_cash] -= amount
# end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets_sold)
  pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  total = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      total.push(pet)
    end
  end
  return total
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet       # return the pet object
    end
  end
  # i want to return value of nil if not in pets
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]      # inside the pets
    if pet[:name] == name         # if the name is the same as the one entered
      pet_shop[:pets].delete(pet) # deleting from the location(:pets)
    end
  end
  return pet
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(pet_shop)
  p pet_shop[:pets]
end

def customer_cash(customers)
  return customers[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customers)
  return customers[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  # does the customer have a pet?
  if pet != nil    # if pet isnt found it equals nil, otherwise carrying on with following ...
    if customer_can_afford_pet(customer, pet)   # checking to see if method is true
      add_pet_to_customer(customer, pet)         # referencing previous method of add_pet_to_customer
      increase_pets_sold(pet_shop, 1)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(pet_shop, pet[:price])
    end
  end

end
