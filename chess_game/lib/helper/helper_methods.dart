bool isWhite(int index) {
  int x = index ~/ 8; // ~/ is integer division
  int y = index % 8; // % is modulo, the remainder of integer division

  // alternate colors for each square
  bool isWhite = (x + y) % 2 == 0;

  return isWhite;
}
