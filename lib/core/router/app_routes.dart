import 'package:flutter/material.dart';
import 'package:octattoo_app/src/authentication/presentation/forgot_password_screen.dart';
import 'package:octattoo_app/src/authentication/presentation/register_screen.dart';
import 'package:octattoo_app/src/authentication/presentation/sign_in_screen.dart';

enum AppRoutes {
  customers(
    'customers',
    '/customers',
    CustomersScreen(),
  ),
  customerDetails(
    'customerDetails',
    ':id',
    CustomerDetailsScreen(),
  ),
  appointments(
    'appointments',
    '/appointments',
    AppointmentsScreen(),
  ),
  appointmentDetails(
    'appointmentDetails',
    ':id',
    AppointmentDetailsScreen(),
  ),
  ;

  const AppRoutes(
    this.name,
    this.path,
    this.screen,
  );

  final String name;
  final String path;
  final Widget screen;
}
