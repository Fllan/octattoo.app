import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/appointment/screens/appointment_details_screen.dart';
import 'package:octattoo_flutter/features/appointment/screens/appointments_screen.dart';
import 'package:octattoo_flutter/features/customer/screens/customer_details_screen.dart';
import 'package:octattoo_flutter/features/customer/screens/customers_screen.dart';
import 'package:octattoo_flutter/features/inventory/screens/inventory_screen.dart';
import 'package:octattoo_flutter/features/invoice/screens/invoices_screen.dart';
import 'package:octattoo_flutter/features/payment/screens/payments_screen.dart';
import 'package:octattoo_flutter/features/project/screens/project_details_screen.dart';
import 'package:octattoo_flutter/features/project/screens/projects_screen.dart';
import 'package:octattoo_flutter/features/quotation/screens/quotations_screen.dart';
import 'package:octattoo_flutter/features/setting/screens/settings_screen.dart';
import 'package:octattoo_flutter/features/tattoo_artist/screens/tattoo_artist_details_screen.dart';
import 'package:octattoo_flutter/features/tattoo_artist/screens/tattoo_artists_screen.dart';
import 'package:octattoo_flutter/features/traceability/screens/traceability_screen.dart';

enum AppRoutes {
  appointments(
    'appointments',
    '/appointments',
    AppointmentsScreen(),
  ),
  appointmentDetails(
    'appointmentDetails',
    ':appointmentId',
    AppointmentDetailsScreen(),
  ),
  customers(
    'customers',
    '/customers',
    CustomersScreen(),
  ),
  customerDetails(
    'customerDetails',
    ':customerId',
    CustomerDetailsScreen(),
  ),
  projects(
    'projects',
    '/projects',
    ProjectsScreen(),
  ),
  projectDetails(
    'projectDetails',
    ':projectId',
    ProjectDetailsScreen(),
  ),
  tattooArtists(
    'tattooArtists',
    '/tattooArtists',
    TattooArtistsScreen(),
  ),
  tattooArtistDetails(
    'tattooArtistDetails',
    ':tattooArtistId',
    TattooArtistDetailsScreen(),
  ),
  quotations(
    'quotations',
    '/quotations',
    QuotationsScreen(),
  ),
  invoices(
    'invoices',
    '/invoices',
    InvoicesScreen(),
  ),
  payments(
    'payments',
    '/payments',
    PaymentsScreen(),
  ),
  traceability(
    'traceability',
    '/traceability',
    TraceabilityScreen(),
  ),
  inventory(
    'inventory',
    '/inventory',
    InventoryScreen(),
  ),
  settings(
    'settings',
    '/settings',
    SettingsScreen(),
  );

  const AppRoutes(
    this.name,
    this.path,
    this.screen,
  );

  final String name;
  final String path;
  final Widget screen;
}
