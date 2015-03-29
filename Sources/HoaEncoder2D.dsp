declare name "HOA";
declare title "High Order Ambisonics library";
declare author "Pierre Guillot, Eliott Paris, Julien Colafrancesco";
declare copyright "2012-2015 Guillot, Paris, Colafrancesco, CICM, Labex Arts H2H, U. Paris 8";
import("math.lib");

HoaEncoder2D(N, x, theta) = par(i, N*2+1,  e(order(i), theta))
with
{
	// The order m of the harmonic[m]	
	order(index)   = int(ceil(index / 2) * ((index %2) * -2 + 1));
	// The exponential imaginary
	// If m > 0 => e^i*m*theta = cos(m * theta)
	// If m < 0 => e^i*m*theta = sin(-m * theta)
	// If m = 0 => e^i*m*theta = 1
	e(m, theta) = ecalcul((m > 0) * 2 + (m < 0), m, theta)
	with 
	{
		ecalcul(2, m, theta) = cos(m * theta);
		ecalcul(1, m, theta) = sin(abs(m) * theta);
		ecalcul(s, m, theta) = 1;
	}; 
};
process(x, theta) = HoaEncoder2D(3, x, theta);