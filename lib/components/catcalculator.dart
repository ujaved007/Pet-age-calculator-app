import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'answer.dart';
import '../utils/catcalculations.dart';

class CatCalculator extends StatefulWidget {
  const CatCalculator({super.key});

  @override
  State<CatCalculator> createState() => _CatCalculatorState();
}

class _CatCalculatorState extends State<CatCalculator> {
  final _yearsController = TextEditingController();
  final _monthsController = TextEditingController();
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
        _calculatedAge = catCalculations(
          _monthsController.text == '' ? 0 : int.parse(_monthsController.text),
          _yearsController.text == '' ? 0 : int.parse(_yearsController.text),
        );
        setState(() {
          _isFormValid = true;
          _humanYears = _calculatedAge['years'];
          _humanMonths = _calculatedAge['months'];
          _showAnswer = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _yearsController.dispose();
    _monthsController.dispose();
    super.dispose();
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
              'How old is your cat?',
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
                    petType: 'cat', years: _humanYears, months: _humanMonths)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
