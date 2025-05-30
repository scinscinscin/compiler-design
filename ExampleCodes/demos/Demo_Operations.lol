// this should be = 78
// (<25> + 3 - 4 / 2) * 3
// (25 + 3 - <2>) * 3
// (<28> - 2) * 3
// (<26>) * 3
// <78>
item val : stats = (5 ** 2 + 3 - 4 / 2) * 3;

broadcast("Val = " + val); // = 78

// this should be 5 or 101 in binary
// note that | has higher precedence over &
// (<0111> & 1001) ^ 100
// (<001>) ^ 100
// <101> or 5
item bitwiseTest : stats = (0b11 | 0b111 & 0b1001) ^ 0b100;

broadcast("bitwiseTest = " + bitwiseTest); // = 5

// now that we know what's happening, let's try combining them
// removing the parentheses from & and ^ should still work cause they're the same level in the hierarchy
item finalVal : stats = ((0b11 | 0b111 & 0b1001 ^ 0b100) ** 2 + 3 - 4 / 2) * 0b11;

// this should still be 78 cause it's just the same as before
broadcast("finalVal = " + finalVal);  // = 78

// to also demonstrate unary operations
// these are evaluated before everything else here
item three : stats = 3;
item one : stats = 1;

item precedenceTest : stats = 5 + 3 % 5 * 2 - --three ** 4 ** (1/2) / ++one;

// just to be super sure about the order : this should be 9
// 5 + 3 % 5 * 2 - <2> ** 4 ** (1/2) / <2>
// 5 + 3 % 5 * 2 - 2 ** 4 ** (0.5) / 2
// 5 + 3 % 5 * 2 - 2 ** <2> / 2
// 5 + 3 % 5 * 2 - <4> / 2
// 5 + <3> * 2 - 4 / 2
// 5 + <6> - 4 / 2
// 5 + 6 - <2>
// <11> - 2
// <9>
broadcast("precedenceTest = " + precedenceTest); // = 9