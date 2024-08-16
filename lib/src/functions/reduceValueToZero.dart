int reduceValueToZero(int no, {int step = 1}) {
  // Original function name: decrementValueUpto0
  if (no - step < 0) {
    return 0;
  } else {
    return no - step;
  }
}