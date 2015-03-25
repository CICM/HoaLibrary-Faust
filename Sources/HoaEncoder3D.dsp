declare name "HOA";
declare title "High Order Ambisonics library";
declare author "Pierre Guillot, Eliott Paris, Julien Colafrancesco";
declare copyright "2012-2015 Guillot, Paris, Colafrancesco, CICM, Labex Arts H2H, U. Paris 8";
import("math.lib");

HoaEncoder3d(0, x, theta, phi) = x;
HoaEncoder3d(N, x, theta, phi) = par(i, (N+1) * (N+1), x * y(degree(i), order(i), theta, phi))
with
{
	degree(index)  = int(sqrt(index));
	order(index)   = int(index - int(degree(index) * int(degree(index) + 1)));
	// The spherical harmonics
	y(l, m, theta, phi) =  e(m, theta) * k(l, m) * p(l, m, cos(phi + PI * 0.5))
	with
	{	
		// The associated Legendre polynomial
		// If l = 0   => p = 1
		// If l = m   => p = -1 * (2 * l + 1) * sqrt(1 - cphi*cphi) * p(l-1, l-1, cphi);
		// If l = m+1 => p = cphi * (2 * l + 1) * p(l-1, l-1, cphi);
		// Else 	   => p = (cphi * (2 * l + 1) * p(l-1, m, cphi) - (l + m) * p(l-2, m, cphi)) / (l - m + 1)
		// with cphi = cos(phi)
		p(l, m, cphi) = pcalcul(((l != 0) & (l == abs(m))) + ((l != 0) & (l == abs(m)+1)) * 2 + ((l != 0) & (l != abs(m)) & (l != abs(m)+1)) * 3, l, m, cphi)
		with
		{
			pcalcul(0, l, m, cphi) = 1;
			pcalcul(1, l, m, cphi) = -1 * (2 * (l-1) + 1) * sqrt(1 - cphi*cphi) * p(l-1, l-1, cphi);
			pcalcul(2, l, m, cphi) = cphi * (2 * (l-1) + 1) * p(l-1, l-1, cphi);
			pcalcul(s, l, m, cphi) = (cphi * (2 * (l-1) + 1) * p(l-1, abs(m), cphi) - ((l-1) + abs(m)) * p(l-2, abs(m), cphi)) / ((l-1) - abs(m) + 1);
		};	

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
		
		// The normalization
		// If m  = 0 => k(l, m) = 1
		// If m != 0 => k(l, m) = sqrt((l - abs(m))! / l + abs(m))!) * sqrt(2)
		k(l, m) = kcalcul((m != 0), l, m)
		with
		{	
			kcalcul(0, l, m) = 1;
			kcalcul(1, l, m) = sqrt(fact(l - abs(m)) / fact(l + abs(m))) * sqrt(2)
			with
			{
				fact(0) = 1;
				fact(n) = n * fact(n-1);
			};
		};

		
	};
};

process(x, theta, phi) = HoaEncoder3d(3, x, theta, phi);