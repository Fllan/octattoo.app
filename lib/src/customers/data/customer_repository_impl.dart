import 'package:octattoo_app/src/customers/application/customer.dart';
import 'package:octattoo_app/src/customers/application/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final List<Customer> _customersList = List.generate(
    60,
    (index) => Customer(id: index + 1, name: 'Customer ${index + 1}'),
  );

  @override
  List<Customer> getCustomers() => _customersList;

  @override
  Customer getCustomerById(int id) {
    return _customersList.firstWhere((customer) => customer.id == id);
  }
}
