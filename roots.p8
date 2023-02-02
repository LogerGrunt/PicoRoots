pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
--main cycle functions

function _init()
--	set_sky_vars()
end

function _update()
	move_selection()
	check_build()	
end

function _draw()
	cls()
	cam_mov()
	map()
	--draw_level()
	draw_selected()
end


-->8
--draw functions


--function draw_level()
--	foreach(sky_tiles,draw_sky)
--end

--function draw_sky(s)
--	spr(3,s[1]*8,s[2]*8)
--end


function draw_selected()
	spr(5,selectionx*8,selectiony*8)
end

function cam_mov()
	camx=mid(0,selectionx-8,112)*8
	camy=mid(0,selectiony-8,48)*8
	camera(camx,camy)
end
-->8
--selection code

selectionx=0
selectiony=0

function move_selection()
	if (btnp(⬆️)) selectiony-=1
	if (btnp(⬇️)) selectiony+=1
	if (btnp(➡️)) selectionx+=1
	if (btnp(⬅️)) selectionx-=1
	selectionx=mid(0,selectionx,15)
	selectiony=mid(0,selectiony,15)
end



-->8

-->8
--misc tile code is here

sky_tiles={3}
earth_tiles={1}
water_tiles={4}
fertile_tiles={17}
rock_tiles={6}
grass_tiles={2}
root_tiles={7}

function tile_type(x,y)
	tile=mget(x,y)
	for i = 1,#sky_tiles do 
		if (sky_tiles[i]==tile) return "sky"
		if (earth_tiles[i]==tile) return "earth"
		if (water_tiles[i]==tile) return "water"
		if (fertile_tiles[i]==tile) return "vitamin"
		if (rock_tiles[i]==tile) return "rock"
	end
	
end	

-->8
--root code

function build_root(x,y)
	if tile_type(x,y)=="water" then
	--warning code here
	end
 	if tile_type(x,y)=="earth" then
  		mset(x,y,7)
 	end	
end

function check_build()
	if btnp(4) then
	 build_root(selectionx,selectiony)
	end
end
__gfx__
000000005555555537333333cccccccc111111117777777744444444554444550000000000000000000000000000000000000000000000000000000000000000
00000000555555557a733733cccccccc111111117000000744444444555445550000000000000000000000000000000000000000000000000000000000000000
007007005555555537337a73cccccccc111111117000000744455544455445540000000000000000000000000000000000000000000000000000000000000000
00077000555555553b333733cccccccc111111117000000744556754444444440000000000000000000000000000000000000000000000000000000000000000
00077000555555553b333b33cccccccc111111117000000745556654444444440000000000000000000000000000000000000000000000000000000000000000
007007005555555533333b33cccccccc111111117000000745555554455445540000000000000000000000000000000000000000000000000000000000000000
000000005555555533333333cccccccc111111117000000744555544555445550000000000000000000000000000000000000000000000000000000000000000
000000005555555533333333cccccccc111111117777777744444444554444550000000000000000000000000000000000000000000000000000000000000000
00000000444bcc440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000045555c440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000415beee40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000041cbecaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000041cd8afa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000077cc8ff40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000007dddfff40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000448888440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
