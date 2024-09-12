#menu set up
pizza_name <- c("Hawaian","Chicken supreme","Cheese")
pizza_key <- c(1:3)
pizza_price <- c(79,89,99)
pizza_menu <- data.frame(pizza_key,pizza_name,pizza_price)
drink <- c("Coke","Sprite","Coffee")
drink_key <- c(4:6)
drink_price <- c(20,20,30)
drink_menu <- data.frame(drink_key,drink,drink_price)
# Pizza order function
pizza_order <- function (){
  cust_name <- readline("Your Name:")
  print(paste("Hello", cust_name,", Welcome to Annie's Pizza"))
  print("What would you like to order today?")
# pizza order
  print( "Here is the list of pizza :")
  print(pizza_menu)
  order_pizza <- as.numeric(readline("press menu key (1-3) :"))
# drink order
  print( "Here is the list of drink")
  print(drink_menu)
  order_drink <- as.numeric(readline("press menu key (4-6) :"))
#comfirm order
  selected_pizza <- pizza_menu[pizza_menu$pizza_key == order_pizza, "pizza_name"]
  selected_drink <- drink_menu[drink_menu$drink_key == order_drink, "drink"]
  print(paste("Your order is:", selected_pizza, ",", selected_drink))
#calculate bill
  price_pizza <- pizza_menu[pizza_menu$pizza_key == order_pizza,"pizza_price"]
  price_drink <- drink_menu[drink_menu$drink_key == order_drink,"drink_price"]
  total_price <- price_pizza + price_drink
  print(paste("Total price is ",total_price))
} 
