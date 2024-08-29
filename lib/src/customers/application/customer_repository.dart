import 'package:octattoo_app/src/customers/application/customer.dart';

abstract class CustomerRepository {
  List<Customer> getCustomers();
  Customer getCustomerById(int id);
}
