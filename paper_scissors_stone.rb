puts """


#### This is a game of paper - scisors - stone ####
#### Good Luck and, may The Force be with you... ##



""" 


# for ASCII representation 

$paper = """                                   
      ________                                      
     /       /                                         
    / paper /                                                          
   /       /                                                
  /_______/             
                                          
           """                                                
                    
$scissors = """
   __   _______            
  |__| /_//____|            
   __|<_________                    
  |___/|__//___/    
      
             """

$stone = """
     __                                                             
  __/   \_
     |_/_|                                                 
     \____|                                                   
   __\___/          
                                                           
          """
          
          
def graph(play)  # depending on the player's pick, print the graph
	if play == "pa"
		puts $paper
	elsif play == "st"
		puts $stone
	elsif play == "sc"
		puts $scissors
	end
end


$com = 0  # the score trackers
$you = 0

$board = {"pa" => "paper",    # semantics for printing the right strings
"sc" => "scissors",
"st" => "stone"
}

#$drawboard = {"pa" => "pa", # useless dead code (to determine the draws)
#"sc" => "sc",
#"st" => "st"
#}

$winboard = {"pa"=> "st",   # what play beats what play
"sc"=> "pa",
"st"=> "sc"
}

def compick()         # the computer's pick
	n = rand(3)
	if n == 0
		$cpick = "pa" # for paper
	elsif n == 1
		$cpick = "sc" # for scizors
	elsif n == 2
		$cpick = "st" # for stone
	end
end


def result(you, pc) # define winning play
	if you == pc
		puts " "
		puts "It's a draw"
		puts " "
	elsif $winboard[you] == pc
		puts " "
		puts "Apparently you won..."
		$you += 1
	else
		puts " "
		puts "Seems you lost..."
		$com += 1
	end
end


def play()		# pick, and compare with the computer
	puts """	pick a play
	
	pa for paper
	sc for scissors
	st for stone
	
	"""
	pick = gets.chomp   # your pick
	if pick == "pa" or pick == "st" or pick == "sc"
		compick()       # computer's pick
		puts ""
		puts ""
		print "   YOU"   # print the graphics
		graph(pick)   
		print "   COM"
		graph($cpick)
		result(pick, $cpick) # compare and print results
	else  # error handling
		puts ""
		puts "you typed something else - retype:"
		print ""
	end
end



# The main game loop
game = true
round = 1


while game
	puts "Play a round?"
	puts "(y or n)"
	x = gets.chomp()
	if x == "n"
		game = false
		puts "" 
		puts "quiting..."
		print ""
	elsif x == "y"
		play()
		puts " "
		puts "In round #{round}  ->  Score: YOU #{$you.to_s} vs COM #{$com.to_s} " 
		puts " "
		round +=1
	else 
		puts ""
		puts "you typed something else"
		puts""
	end
end
