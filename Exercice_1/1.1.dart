import 'dart:math' as Math;

main() {

	int PV = 10000;
	double interest = 0.055;
	int period = 10;
	double result = PV * Math.pow((1 + interest), period);
	print(result);
}