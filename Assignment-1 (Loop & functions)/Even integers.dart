void printEvenNumbers(List<int> numbers) {
  for (var number in numbers) {
    if (number % 2 == 0) {
      print(number);
    }
  }
}

void main() {
  printEvenNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9]);
}
