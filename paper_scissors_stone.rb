puts """


#### This is a game of paper - scisors - stone ####
#### Good Luck and, may The Force be with you... ##

""" 


# for "graphical" representation 

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

$board = {"pa" => "paper",
"sc" => "scissors",
"st" => "stone"
}

$drawboard = {"pa" => "pa", # to determine the draws later on
"sc" => "sc",
"st" => "st"
}

$winboard = {"pa"=> "st",   # what beats what
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


def result(you,pc) # define winning play (x for the player, y for the computer)
	if $drawboard[you] == pc
		puts " "
		puts "It's a draw"
		puts " "
	elsif $winboard[you] == pc
		puts " "
		puts "Apparently you won..."
		puts " "
		$you += 1
	else
		puts " "
		puts "Seems you lost..."
		puts " "
		$com += 1
	end
end


def play()		# pick, and compare with the computer
	puts """	pick a play
	
	pa for paper
	sc for scissors
	st for stone
	
	"""
	pick = gets.chomp
	if pick == "pa" or "st" or "sc"
		compick()
		puts ""
		puts ""
		print "   YOU"
		graph(pick)
		print "   COM"
		graph($cpick)
		result(pick, $cpick)
	else
		puts "you typed something else - retype:"
	end
end



# The main game loop
game = true
round = 1


while game == true
	puts "Play a round?"
	puts "(y or n)"
	x = gets.chomp()
	if x == "n"
		game = false 
		puts "quiting..."
	elsif x == "y"
		play()
		puts " "
		puts "This was round #{round}   |   Score: YOU #{$you.to_s} vs COM #{$com.to_s} " 
		puts " "
		round +=1
	else puts "you typed something else"
	end
end
                                                                            
