class_name Upgrade
extends Node
## Abstract class defining an upgrade

## Emitted when the upgrade has leveled up
signal leveled_up

## Level of the upgrade
var level : int = -1
## Title of the upgrade
var title : String = "Not defined"
## Base cost of the upgrade
var base_cost : int = -1
## Current cost of the upgrade
var cost : int = -1

## Virtual class
## Retrunt he description of the upgrade
func description() -> String:
	return "Description not defined"

## Virtual class
## Returns the current cost based on the level
func calculate_cost() -> void:
	cost = -1
	
	
	
	
## Virtual class
## Retruns if player can buy the upgrade or not
func can_afford() -> bool:
	return false
	
## Virtual class
## Consumes potatoes to level up 			
func level_up() -> void:
	printerr("Method not define")
