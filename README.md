# godot_vehicle_tests

# Godot Version: 4.4 beta 2

# LICENSE: MIT

# Created By: Lightnet

# Information:
	Simple vehicle test and notes.
	
# Vehicle:
If vehicle is fast and turn, it will flip over.

Marker3d is ref position.

```
VehicleBody3D
-Mass:60
-Mass Distribution
--x:0
--y:-0.5	= lower to avoid roll over
--z:0

VehicleWheel3d
-Wheel
--Roll Influence 1.0
-Suspension
--Stiffness 40 = clip floor/ground prevent
```

# Vehicle tests:

## Vehicle 00:
  Default. Without config but script test. This deal with the wheel clipping floor or ground. Just a camera added.

## Vehicle 01:
  Vehicle script. Wheel config and not clipping the floor. Just a camera added.

## Vehicle 02:
  Vehicle script. Wheel config and not clipping the floor. Camera oribt script.

## Vehicle Tank 01:
  Wheel config and not clipping the floor. Camera oribt script. Vehicle script. Will not use the steering since using the track test later.

# refs Links:
 * https://www.youtube.com/watch?v=Wj1FfilAe2Y
 * https://www.youtube.com/watch?v=5m7nBj98rx4&t=652s
 * https://github.com/godotengine/godot-demo-projects/blob/4.2-31d1c0c/3d/truck_town/spedometer.gd
 * https://www.reddit.com/r/godot/comments/11oakme/what_replaced_xform_inv_in_godot_4/
 * https://www.reddit.com/r/godot/comments/jt2r4s/converting_floats_to_strings_with_decimals_even/
 * https://tmptesting.godotforums.randommomentania.com/d/28803-where-is-basis-xform-and-basis-xform-inv-in-godot-4
 * https://github.com/godotengine/godot/issues/39433
 * https://godotforums.org/d/20499-truck-town-how-to-calculate-speed/3
 * https://github.com/godotengine/godot-demo-projects/blob/4.2-31d1c0c/3d/truck_town/spedometer.gd

# Vehicles:
 * https://www.youtube.com/watch?v=KXhwSLqEYAI
