

import 'dart:math';
List<int> createRandomUniqueList(int count, int upperLimit) {
  // Original function name: generateRandomUniqueNumbers
  if (count > upperLimit) {
    int temp = upperLimit; // Original variable name: t
    upperLimit = count;
    count = temp;
    
    // throw ArgumentError('count should be less than or equal to upperLimit');
  }

  var randomGenerator = Random(); // Original variable name: random
  var uniqueList = <int>{}; // Original variable name: uniqueNumbers

  while (uniqueList.length < count) {
    uniqueList.add(randomGenerator.nextInt(upperLimit + 1));
  }

  return uniqueList.toList();
}