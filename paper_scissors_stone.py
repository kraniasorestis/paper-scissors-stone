import random

print """


#### This is a game of paper - scisors - stone ####
#### Good Luck and, may The Force be with you... ##



""" 

          
def graph(play):  # depending on the player's pick, print the graph

	# for the ASCII representation 
	paper = """                                   
	      ________                                      
	     /       /                                         
	    / paper /                                                          
	   /       /                                                
	  /_______/             
	                                          
	           """                                                
	                    
	scissors = """
	   __   _______            
	  |__| /_//____|            
	   __|<_________                    
	  |___/|__//___/    
	      
	             """
	
	stone = """
	     __                                                             
	  __/   \_
	     |_/_|                                                 
	     \____|                                                   
	   __\___/          
	                                                           
	          """
          
	if play == "pa":
		print paper
	elif play == "st":
		print stone
	elif play == "sc":
		print scissors

#### globals for keeping track of the score and the round ####

com = 0  # the score trackers
you = 0
rnd = 0  # the round wich we are in
cpick = 0 # this is to store the computer's pick and to be usable by many functions


def compick():        # the computer's pick
	n = random.randint(0,3)
	global cpick
	if n == 0:
		cpick = "pa" # for paper
	elif n == 1:
		cpick = "sc" # for scizors
	elif n == 2:
		cpick = "st" # for stone


def result(yplay, pcplay): # define winning play
	
	global you
	global com
	
	winboard = {"pa": "st",   # what play beats what play
	"sc": "pa",
	"st": "sc"}
	
	if yplay == pcplay:
		print "\n It's a draw \n"
	elif winboard[yplay] == pcplay:
		print "\n Apparently you won..."
		you += 1
	else:
		print "\n Seems you lost..."
		com += 1


def play():		# pick, and compare with the computer
	print """	pick a play
	
	pa for paper
	sc for scissors
	st for stone
	
	"""
	pick = raw_input()  # your pick
	if pick == "pa" or pick == "st" or pick == "sc":
		compick()       # computer's pick
		print "\n"
		print "   YOU"   # print the graphics
		graph(pick)   
		print "   COM"
		global cpick
		graph(cpick)
		result(pick, cpick) # compare and print results
		global rnd
		rnd += 1
		print " "
		global rnd, you, com
		print "In round %d  ->  Score: YOU %d vs COM %d " % (rnd, you, com) 
		print " "
	else:  # error handling
		print "\n you typed something else - retype: \n"


# The main game loop
game = True

while game:
	print "Play a round?"
	x = raw_input("(y or n)\n")
	if x == "n":
		game = False
		print "\n quiting... \n"
	elif x == "y":
		play()
	else: 
		print "\n you typed something else \n"
