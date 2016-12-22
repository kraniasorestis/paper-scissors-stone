import random

print """


#### This is a game of paper - scisors - stone ####
#### Good Luck and have fun! ##



"""

#### globals for keeping track of the score and the round ####

com = 0  # the score trackers
you = 0
rnd = 0  # the round wich we are in
cpick = 0 # this is the computer's pick and is used by many functions


def graph(play):  # depending on the player's pick, print the graph

	# ASCII representations of the possible picks
	paper = """
	      ________
	     /       /
	    / paper /
	   /       /
	  /_______/

	           """

	scissors = """
	   __   _______
	  |__| /_//____\
	   __|<_________
	  |___/|__//___/

	             """

	stone = """
	     __ _
	  __/  |_\
	     |_/__|
	     \____|
	   __\___/

	          """

	if play == "pa":    # for paper
		print paper
	elif play == "st":  # for scizors
		print stone
	elif play == "sc":  # for stone
		print scissors


def compick():        # the computer's pick
	n = random.randint(0,3)
	global cpick
	if n == 0:
		cpick = "pa"
	elif n == 1:
		cpick = "sc"
	elif n == 2:
		cpick = "st"


def result(yplay, pcplay): # define winning play

	global you # for adjusting the score record
	global com

	winboard = {"pa": "st",   # what play beats what play
	"sc": "pa",
	"st": "sc"}

	if yplay == pcplay:
		print "\n It's a draw \n"
	elif winboard[yplay] == pcplay:
		print "\n Apparently you won..."
		you += 1 # adjusting the score record
	else:
		print "\n Seems you lost..."
		com += 1 # adjusting the score record


def play():		# pick, and compare with the computer
	print """	pick a play

	pa for paper
	sc for scissors
	st for stone

	"""
	pick = raw_input()  # your pick
	if pick == "pa" or pick == "st" or pick == "sc":
		compick()       # computer's pick
		print "\n   YOU"   # print the graphics
		graph(pick)
		print "   COM"
		global cpick
		graph(cpick)
		result(pick, cpick) # compare and print results
		global rnd
		rnd += 1  # adjust the round count
		global rnd, you, com
		print "\n In round %d  ->  Score: YOU %d vs COM %d \n" % (rnd, you, com)
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
