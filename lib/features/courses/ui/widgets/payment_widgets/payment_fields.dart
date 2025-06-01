import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final TextEditingController nameOnCardController;

  const PaymentFields({
    super.key,
    required this.formKey,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvvController,
    required this.nameOnCardController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          _buildCardNumberField(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildExpiryDateField()),
              const SizedBox(width: 16),
              Expanded(child: _buildCVVField(context)),
            ],
          ),
          const SizedBox(height: 16),
          _buildNameOnCardField(),
        ],
      ),
    );
  }

  Widget _buildNameOnCardField() {
    return TextFormField(
      controller: nameOnCardController,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter name on card";
        } else if (value.length < 3) {
          return "Please enter a valid name on card";
        }
        return null;
      },
      decoration: _buildInputDecoration(
        labelText: "Card Holder Name",
        hintText: "Hossam Ahmed",
        icon: Icons.person,
      ),
    );
  }

  Widget _buildCVVField(BuildContext context) {
    return TextFormField(
      controller: cvvController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter CVV";
        } else if (value.length < 3) {
          return "Please enter a valid CVV";
        }
        return null;
      },
      maxLength: 3,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) {
        return null;
      },
      decoration: _buildInputDecoration(
        labelText: "CVV",
        hintText: "CVV",
        icon: Icons.security,
      ),
      onChanged: (value) {
        if (value.length == 3) {
          FocusScope.of(context).nextFocus();
        }
      },
    );
  }

  Widget _buildExpiryDateField() {
    return TextFormField(
      controller: expiryDateController,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter expiry date";
        } else if (value.length < 4) {
          return "Please enter a valid expiry date";
        }
        return null;
      },
      maxLength: 4,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) {
        return null;
      },
      decoration: _buildInputDecoration(
        labelText: "Expiry Date",
        hintText: "MM/YY",
        icon: Icons.calendar_month,
      ),
    );
  }

  Widget _buildCardNumberField() {
    return TextFormField(
      controller: cardNumberController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter card number";
        } else if (value.length < 16) {
          return "Please enter a valid card number";
        }
        return null;
      },
      maxLength: 16,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) {
        return null;
      },
      decoration: _buildInputDecoration(
        labelText: "Card Number",
        hintText: "1234 5678 9012 3456",
        icon: Icons.credit_card,
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String labelText,
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      errorStyle: const TextStyle(color: Colors.red),
    );
  }
}
