class Customer {
  final int id;
  final String name;

  Customer({required this.id, required this.name});
}

final List<Customer> customersList = List.generate(
  10,
  (index) => Customer(id: index + 1, name: 'Customer ${index + 1}'),
);
