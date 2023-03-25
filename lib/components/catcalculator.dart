import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'answer.dart';

class CatCalculator extends StatefulWidget {
  const CatCalculator({super.key});

  @override
  State<CatCalculator> createState() => _CatCalculatorState();
}

class _CatCalculatorState extends State<CatCalculator> {
  final _yearsController = TextEditingController();
  final _monthsController = TextEditingController();
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
        catCalculator(
            _monthsController.text == ''
                ? 0
                : int.parse(_monthsController.text),
            _yearsController.text == '' ? 0 : int.parse(_yearsController.text));
      }
    }
  }

  void catCalculator(int months, int years) {
    if (years == 0 && months > 0) {
      int age = months * 15;
      setState(() {
        _humanYears = (age / 12).floor();
        _humanMonths = age % 12;
      });
    } else if (years == 1) {
      int age = months * 9;
      setState(() {
        _humanYears = 15 + (age / 12).floor();
        _humanMonths = age % 12;
      });
    } else if (years == 2) {
      int age = months * 4;
      setState(() {
        _humanYears = 24 + (age / 12).floor();
        _humanMonths = age % 12;
      });
    } else if (years > 2) {
      int age = months * 4;
      setState(() {
        _humanYears = 24 + (age / 12).floor() + ((years - 2) * 4);
        _humanMonths = age % 12;
      });
    }
    //show Answer widget
    setState(() {
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
            const Text('How old is your cat?'),
            const SizedBox(height: 12),
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
                    petType: 'cat', years: _humanYears, months: _humanMonths)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
