#include <iostream>

using namespace std;

extern "C" {unsigned int bitstuffing(unsigned int a);}

int main () {

	//unsigned int in = 0x0;
	unsigned int in = 0xFFFFFFFF;
	unsigned int out = bitstuffing(in);
	//unsigned int verif = 0x04104104;
	unsigned int verif = 0xFBEFBEFB;

	if (out==verif) cout << endl << "OK: " << hex << out << dec << endl;
	else cout << endl << "ERROR: " << hex << out << dec << endl;

	return 0;
}
