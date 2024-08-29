// lib/src/customers/providers/customer_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/customers/application/customer.dart';
import 'package:octattoo_app/src/customers/application/customer_repository.dart';
import 'package:octattoo_app/src/customers/data/customer_repository_impl.dart';

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepositoryImpl();
});

final customerListProvider = Provider<List<Customer>>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.getCustomers();
});

final selectedCustomerProvider = StateProvider<Customer?>((ref) => null);
