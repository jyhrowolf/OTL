// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function tier_calculate(hex)
{
	var _hex = axial_to_cube(hex);
	return max(abs(_hex[0]),abs(_hex[1]),abs(_hex[2]));
}

function pixel_to_flat_hex(point,_size)
{
    var q = ( 2./3 * point[0]                        ) / _size;
    var r = (-1./3 * point[0]  +  sqrt(3)/3 * point[1]) / _size;
    return axial_round([q, r]);
}

function flat_hex_to_pixel(hex,_size)
{
    var _x = _size * (     3./2 * hex[0]                    );
    var _y = _size * (sqrt(3)/2 * hex[0]  +  sqrt(3) * hex[1]);
    return [_x, _y];
}

function cube_to_axial(cube)
{
    var q = cube[0];
    var r = cube[1];
    return [q, r];
}

function cube_round(frac)
{
    var q = round(frac[0]);
    var r = round(frac[1]);
    var s = round(frac[2]);
	
    var q_diff = abs(q - frac[0]);
    var r_diff = abs(r - frac[1]);
    var s_diff = abs(s - frac[2]);

    if (q_diff > r_diff and q_diff > s_diff)
        q = -r-s;
    else if (r_diff > s_diff)
        r = -q-s;
    else
        s = -q-r;

    return [q, r, s];
}

function axial_to_cube(hex)
{
    var q = hex[0];
    var r = hex[1];
    var s = -q-r;
    return [q, r, s];
}

function axial_round(hex)
{
    return cube_to_axial(cube_round(axial_to_cube(hex)));
}