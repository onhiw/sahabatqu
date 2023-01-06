import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar flushbarMessage(String message, Color color) => Flushbar(
      message: message,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 4),
      messageSize: 12,
      backgroundColor: color,
    );
