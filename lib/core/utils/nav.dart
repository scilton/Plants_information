import 'package:flutter/material.dart';

void navigateNamedTo(context, String route, {var arguments}) =>
    Navigator.pushNamed(context, route, arguments: arguments);

void navigateNamedFinish(context, String route, {var arguments}) =>
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
        arguments: arguments);

