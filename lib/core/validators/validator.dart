import 'package:flutter/material.dart';
import 'package:enently/l10n/app_localizations.dart';

class Validators {
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static String? validateName(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;

    if (value == null || value.isEmpty) {
      return l10n.name_required;
    }

    if (value.length < 2) {
      return l10n.name_too_short;
    }

    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;

    if (value == null || value.isEmpty) {
      return l10n.enter_your_email;
    }

    if (!emailRegex.hasMatch(value)) {
      return l10n.invalid_email;
    }

    return null;
  }

  static String? validateTitle(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return l10n.title_required;
    }

    if (value.trim().length < 3) {
      return l10n.title_too_short;
    }

    return null;
  }

  static String? validateDescription(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return l10n.description_required;
    }

    if (value.trim().length < 10) {
      return l10n.description_too_short;
    }

    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;

    if (value == null || value.isEmpty) {
      return l10n.enter_your_password;
    }

    if (value.length < 6) {
      return l10n.password_too_short;
    }

    return null;
  }

  static String? validatePhone(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;

    if (value == null || value.isEmpty) {
      return l10n.phone_required;
    }

    if (!RegExp(r'^\d{11}$').hasMatch(value)) {
      return l10n.invalid_phone;
    }

    return null;
  }
}
