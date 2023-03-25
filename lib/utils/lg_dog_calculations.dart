lgDogCalculations(int months, int years) {
  int age;
  int humanYears;
  int humanMonths;
  if (years == 5) {
    age = months * 9;
    humanYears = 36 + (age / 12).floor();
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  } else if (years > 5) {
    age = months * (_lgDogMultiplier(years));
    humanYears = _lgDogEq(years) + (age / 12).floor();
    humanMonths = age % 12;
    return {'years': humanYears, 'months': humanMonths};
  }
}

int _lgDogEq(int age) {
  int n = age - 5;
  return (5.4 * n + 39.2364).round();
}

int _lgDogMultiplier(years) {
  return _lgDogEq(years + 1) - _lgDogEq(years);
}
