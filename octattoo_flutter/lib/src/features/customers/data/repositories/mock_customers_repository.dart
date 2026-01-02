import 'package:octattoo_flutter/core/base/base_repository.dart';
import 'package:octattoo_flutter/src/features/customers/data/repositories/customers_repository.dart';
import 'package:octattoo_flutter/src/features/customers/domain/models/customer.dart';

/// Mock implementation of CustomersRepository for development.
class MockCustomersRepository extends BaseRepository
    implements CustomersRepository {
  final List<Customer> _customers = [
    Customer(
      id: 'cust-1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '+1234567890',
      notes: 'Prefers tribal designs',
      dateAdded: DateTime.now().subtract(const Duration(days: 30)),
    ),
    Customer(
      id: 'cust-2',
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phone: '+1987654321',
      notes: 'First-time customer, interested in floral designs',
      dateAdded: DateTime.now().subtract(const Duration(days: 15)),
    ),
    Customer(
      id: 'cust-3',
      name: 'Bob Johnson',
      email: 'bob.j@example.com',
      dateAdded: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 500));

  @override
  Future<List<Customer>> getCustomers() async {
    return executeWithLogging(() async {
      await _delay();
      return List.unmodifiable(_customers);
    }, 'getCustomers');
  }

  @override
  Future<Customer?> getCustomerById(String id) async {
    return executeWithLogging(() async {
      await _delay();
      return _customers.where((c) => c.id == id).firstOrNull;
    }, 'getCustomerById($id)');
  }

  @override
  Future<Customer> createCustomer(Customer customer) async {
    return executeWithLogging(() async {
      await _delay();
      final newCustomer = customer.copyWith(
        id: 'cust-${DateTime.now().millisecondsSinceEpoch}',
        dateAdded: DateTime.now(),
      );
      _customers.add(newCustomer);
      return newCustomer;
    }, 'createCustomer');
  }

  @override
  Future<Customer> updateCustomer(Customer customer) async {
    return executeWithLogging(() async {
      await _delay();
      final index = _customers.indexWhere((c) => c.id == customer.id);
      if (index == -1) {
        throw Exception('Customer not found: ${customer.id}');
      }
      _customers[index] = customer;
      return customer;
    }, 'updateCustomer(${customer.id})');
  }

  @override
  Future<void> deleteCustomer(String id) async {
    return executeWithLogging(() async {
      await _delay();
      _customers.removeWhere((c) => c.id == id);
    }, 'deleteCustomer($id)');
  }

  @override
  Future<List<Customer>> searchCustomers(String query) async {
    return executeWithLogging(() async {
      await _delay();
      final lowerQuery = query.toLowerCase();
      return _customers
          .where((c) =>
              c.name.toLowerCase().contains(lowerQuery) ||
              c.email.toLowerCase().contains(lowerQuery) ||
              (c.phone?.toLowerCase().contains(lowerQuery) ?? false))
          .toList();
    }, 'searchCustomers($query)');
  }
}
