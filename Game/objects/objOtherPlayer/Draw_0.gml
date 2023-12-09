///@desc Draw Player

//Animate the tail
ImageIndex += ImageSpeed; 

//Draw Tail
draw_sprite_ext(SpriteTail, ImageIndex, x-2*XS, y-8, XS, YS, image_angle, image_blend, image_alpha)

//Draw Character
draw_sprite_ext(sprite_index, image_index, x, y, XS, YS, image_angle, image_blend, image_alpha)