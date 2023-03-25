import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'answer.dart';
import '../utils/catcalculations.dart';
import '../utils/md_dog_calculations.dart';
import '../utils/lg_dog_calculations.dart';

class DogCalculator extends StatefulWidget {
  const DogCalculator({super.key});

  @override
  State<DogCalculator> createState() => _DogCalculatorState();
}

class _DogCalculatorState extends State<DogCalculator> {
  final _yearsController = TextEditingController();
  final _monthsController = TextEditingController();
  String _breed = 'small';
  var _calculatedAge;
  var _humanYears;
  var _humanMonths;
  bool _isFormValid = true;
  bool _showAnswer = false;

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      if (_yearsController.text == '' && _monthsController.text == '') {
        setState(() {
          _isFormValid = false;
          _showAnswer = false;
        });
      } else {
        setState(() {
          _isFormValid = true;
        });
        if (_breed == 'small') {
          // cats and small dogs have identical age progressions throughout their life.
          //So can re-use catCalculations() in dog small breed calculations too.
          calculateAge(catCalculations);
        } else if (_breed == 'medium') {
          // cats and all dogs have identical age progression until 5years old.
          //So can re-use catCalculations() in those calculations too.
          if (int.parse(_yearsController.text) <= 5) {
            calculateAge(catCalculations);
          } else {
            calculateAge(mdDogCalculations);
          }
        } else if (_breed == 'large') {
          if (int.parse(_yearsController.text) <= 5) {
            calculateAge(catCalculations);
          } else {
            calculateAge(lgDogCalculations);
          }
        }
      }
    }
  }

  void calculateAge(calculator) {
    _calculatedAge = calculator(
      _monthsController.text == '' ? 0 : int.parse(_monthsController.text),
      _yearsController.text == '' ? 0 : int.parse(_yearsController.text),
    );
    setState(() {
      _humanYears = _calculatedAge['years'];
      _humanMonths = _calculatedAge['months'];
      _showAnswer = true;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select the breed size',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                ActionChip(
                  label: const Text('Small'),
                  onPressed: () {
                    setState(() {
                      _breed = 'small';
                    });
                  },
                  labelPadding: const EdgeInsets.only(left: 12, right: 12),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: _breed == 'small'
                          ? const Color(0xff000072)
                          : Colors.transparent,
                      width: 1.4,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ActionChip(
                  label: const Text('Medium'),
                  onPressed: () {
                    setState(() {
                      _breed = 'medium';
                    });
                  },
                  labelPadding: const EdgeInsets.only(left: 12, right: 12),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: _breed == 'medium'
                          ? const Color(0xff000072)
                          : Colors.transparent,
                      width: 1.4,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ActionChip(
                  label: const Text('Large'),
                  onPressed: () {
                    setState(() {
                      _breed = 'large';
                    });
                  },
                  labelPadding: const EdgeInsets.only(left: 12, right: 12),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: _breed == 'large'
                          ? const Color(0xff000072)
                          : Colors.transparent,
                      width: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'How old is your dog?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _yearsController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                label: Text('Years'),
              ),
              onChanged: (value) {
                setState(() {
                  _showAnswer = false;
                });
              },
            ),
            TextFormField(
              controller: _monthsController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                label: Text('Months'),
              ),
              validator: (value) {
                if (value == null || value == '') {
                  return null;
                } else if (int.parse(value) > 11) {
                  return 'Months value cannot be greater than 11';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                setState(() {
                  _showAnswer = false;
                });
              },
            ),
            !_isFormValid
                ? Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: const Text(
                      'Both months and years cannot be empty',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox(height: 20),
            ElevatedButton(
              onPressed: validateForm,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            _showAnswer
                ? Answer(
                    petType: 'dog', years: _humanYears, months: _humanMonths)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
