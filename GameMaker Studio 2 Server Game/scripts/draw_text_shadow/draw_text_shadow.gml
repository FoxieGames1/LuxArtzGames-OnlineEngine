// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function draw_text_shadow(X, Y, TEXT, MainColor, ShadowColor)
{
	draw_set_color(ShadowColor)
	draw_text(X+1,Y+1,string(TEXT))
	draw_set_color(MainColor)
	draw_text(X,Y,string(TEXT))
}