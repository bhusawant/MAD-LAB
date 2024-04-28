int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

int lcm(int a, int b) {
  if (a == 0 || b == 0) {
    return 0; //Handle zero edge case
  }
  return (a * b) ~/ gcd(a, b);
}

void main() {
  int num1 = 12, num2 = 20;
  int gcdValue = gcd(num1, num2);
  int lcmValue = lcm(num1, num2);
  print("GCD of $num1 and $num2 is $gcdValue");
  print("LCM of $num1 and $num2 is $lcmValue");
}
