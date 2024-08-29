import 'package:octattoo_app/src/customers/application/customer.dart';

final List<Customer> customersList = List.generate(
  60,
  (index) => Customer(id: index + 1, name: 'Customer ${index + 1}'),
);
