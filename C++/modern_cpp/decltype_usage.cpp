#include <iostream>
#include <type_traits>

using namespace std;

int main()
{
	auto x = 1;
	auto y = 2;
	decltype(x + y) z;

	if (std::is_same<decltype(x), int>::value) {
		std::cout << "type x == int" << std::endl;
	}

	if (std::is_same<decltype(x), float>::value) {
		std::cout << "type x == float" << std::endl;
	}

	if (std::is_same<decltype(x), decltype(z)>::value) {
		std::cout << "type x == type z" << std::endl;
	}

	// output
	// type x == int
	// type x == type z
}