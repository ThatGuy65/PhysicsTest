extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var remainder = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func move_x(amount, callback): 
	remainder.x += amount 
	var move = round(remainder.x) 
	if(move != 0): 
		remainder.x -= move 
		move_x_exact(move, callback)
	
func move_x_exact(amount, callback):
	var step = sign(amount)
	while(amount != 0):  
		if Game.check_walls_collision(self, Vector2(step, 0)): 
			callback.call_func() 
			return
		global_position.x += step 
		amount -= step

func move_y(amount, callback): 
	remainder.y += amount 
	var move = round(remainder.y) 
	if(move != 0): 
		remainder.y -= move 
		move_y_exact(move, callback)
	
func move_y_exact(amount, callback):
	var step = sign(amount)
	while(amount != 0):  
		if Game.check_walls_collision(self, Vector2(0, step)): 
			callback.call_func() 
			return
		global_position.y += step 
		amount -= step 
	
func zero_remainder_x(): 
	remainder.x = 0 
func zero_remainder_y(): 
	remainder.y = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
