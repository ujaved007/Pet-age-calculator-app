catCalculations(int months, int years) {
  int age;
  int humanYears;
  int humanMonths;
  if (years == 0 && months > 0) {
    age = months * 15;
    humanYears = (age / 12).floor();
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  } else if (years == 1) {
    age = months * 9;
    humanYears = 15 + (age / 12).floor();
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  } else if (years == 2) {
    age = months * 4;
    humanYears = 24 + (age / 12).floor();
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  } else if (years > 2) {
    age = months * 4;
    humanYears = 24 + (age / 12).floor() + ((years - 2) * 4);
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  }
}
