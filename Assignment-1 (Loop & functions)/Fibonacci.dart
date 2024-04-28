void printFibonacciSeries(int limit) {
  int a = 0, b = 1;
  print('FibonacciSeries:');
  while (a <= limit) {
    print(a);
    var temp = a + b;
    a = b;
    b = temp;
  }
}

void main() {
  printFibonacciSeries(100);
}
