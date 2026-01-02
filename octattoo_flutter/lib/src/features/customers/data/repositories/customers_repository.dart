import 'package:octattoo_flutter/src/features/customers/domain/models/customer.dart';

/// Repository interface for managing customers.
abstract class CustomersRepository {
  Future<List<Customer>> getCustomers();
  Future<Customer?> getCustomerById(String id);
  Future<Customer> createCustomer(Customer customer);
  Future<Customer> updateCustomer(Customer customer);
  Future<void> deleteCustomer(String id);
  Future<List<Customer>> searchCustomers(String query);
}
