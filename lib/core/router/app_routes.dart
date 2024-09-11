import 'package:flutter/material.dart';
import 'package:octattoo_app/src/app/appointments/presentation/appointment_details_screen.dart';
import 'package:octattoo_app/src/app/appointments/presentation/appointments_screen.dart';
import 'package:octattoo_app/src/app/customers/presentation/customer_details_screen.dart';
import 'package:octattoo_app/src/app/customers/presentation/customers_screen.dart';

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
    AppointmentDetailsScreen(
      idAppointment: '',
    ),
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
