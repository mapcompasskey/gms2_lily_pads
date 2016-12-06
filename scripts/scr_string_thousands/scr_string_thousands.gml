/// scr_string_thousands(integer)
//
// Add thousand separators to an integar and return the string.
//
{
	var str, i;
	str = string(argument0);
	for (i = string_length(str) - 2; i > 1; i -= 3)
	{
	    str = string_insert(",", str, i);
	}
	return str;
}