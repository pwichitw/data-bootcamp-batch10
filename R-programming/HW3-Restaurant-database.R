# Create restaurant.db
library(RSQLite)
# data setup
id <- c(1:6,10:14,21:23) 
name <- c("CHICKEN NOODLE","CHICKEN RICE","CHICKEN FRIED RICE",
          "PORK NOODLE","PORK RICE","PORK FRIED RICE",
          "COKE","SPRITE","WATER","ORANGE JUICE","COFFEE",
          "ICE CREAM","TOAST","WAFFLE")
price <- c(60,65,65,60,65,65,20,20,10,25,40,40,30,30)
type <- c("food","food","food","food","food","food",
          "Beverage","Beverage","Beverage","Beverage","Beverage",
          "Dessert","Dessert","Dessert")

cust_id <- (1:4)
cust_name <- c("John","Jane","Mary","James")
cust_surname <- c("Musk","Luke","Wick","Wang")
cust_phone <- c("0812345678","0823456789","0834567890","0845678901")
inv_date <- c("01-01-2024","01-01-2024","01-01-2024",
                "02-01-2024","02-01-2024","02-01-2024",
                "03-01-2024","03-01-2024","03-01-2024",
                "04-01-2024","04-01-2024","04-01-2024","04-01-2024")
inv_id <- c(101,101,101,102,103,103,104,105,105,106,
            107,108,109)
cust_id <- c(1,1,1,2,3,3,1,1,1,4,2,3,1)
menu_id <- c(1,12,13,3,4,11,1,1,12,5,22,3,14)

con <- dbConnect(SQLite(),"restaurant.db")
dbWriteTable(con,"menu",
             data.frame(
               id ,name, price ,type
             ))
dbListTables(con,menu)
dbWriteTable(con,"customers",
             data.frame(
               cust_id ,cust_name, cust_surname ,cust_phone
             ))
dbWriteTable(con,"daily_transaction",
             data.frame(
               inv_date ,inv_id, cust_id ,menu_id
             ))
dbListTables(con,menu)
dbListTables(con,customers)
dbListTables(con,daily_transaction)
dbGetQuery(con,"select * from menu")
dbGetQuery(con,"select * from customers")
dbGetQuery(con,"select * from daily_transaction")
