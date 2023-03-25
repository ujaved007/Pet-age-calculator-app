import 'dart:math';

mdDogCalculations(int months, int years) {
  int age;
  int humanYears;
  int humanMonths;
  if (years == 5) {
    age = months * 6;
    humanYears = 36 + (age / 12).floor();
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  } else if (years > 5) {
    age = months * (mdDogMultiplier(years));
    humanYears = mdDogEq(years) + (age / 12).floor();
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  }
}

int mdDogEq(int age) {
  int n = age - 5;
  return ((1 / 4) * ((18 * n) + (pow(-1, n) + 151))).round();
}

int mdDogMultiplier(int years) {
  return (mdDogEq(years + 1) - mdDogEq(years));
}
