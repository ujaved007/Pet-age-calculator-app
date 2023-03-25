import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CatCalculator extends StatefulWidget {
  const CatCalculator({super.key});

  @override
  State<CatCalculator> createState() => _CatCalculatorState();
}

class _CatCalculatorState extends State<CatCalculator> {
  final _yearsController = TextEditingController();
  final _monthsController = TextEditingController();
  bool _isFormValid = true;

  validateForm() {
    if (_formKey.currentState!.validate()) {
      if (_yearsController.text == '' && _monthsController.text == '') {
        setState(() {
          _isFormValid = false;
        });
      } else {
        setState(() {
          _isFormValid = true;
        });
      }
    }
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
            ),
            TextFormField(
              controller: _monthsController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                label: Text('Months'),
              ),
              validator: (value) {
                if (value != null && int.parse(value) > 11) {
                  return 'Months value cannot be greater than 11';
                } else {
                  return null;
                }
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
            )
          ],
        ),
      ),
    );
  }
}
