#Pao Ying Chub program

play_game  <- function() {
  #set welcome message and set parameter
  print("Let's play Pao Ying Chub!!")
  print("We'll play ten times and count score.")
  count <- 0
  cpu_score <- 0
  player_score <- 0

  while (count < 10) {
    print ("Select r : Rock, s : Scissors , p : paper")
    player <- readline ("Your turn : " )
    cpu <- sample (c("r","s","p"),1)
    print (paste("com is ",cpu))
    if (player == cpu) {
      print ("Draw") }
      else if (player == "r" & cpu == "s" | 
               player == "s" & cpu == "p" | 
               player == "p" & cpu == "r") {
        print ("Win")
        player_score <- player_score + 1
      }
      else 
        {print ("Lose")
        cpu_score <- cpu_score +1 }
    count <- count + 1
  }
  print ("Finish!!")
  print (paste("your score is",player_score,"/10"))
  if (player_score > cpu_score) {
    print("You win!!")
  } else print ("You lose!!")
}

