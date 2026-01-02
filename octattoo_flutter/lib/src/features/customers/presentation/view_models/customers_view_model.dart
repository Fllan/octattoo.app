import 'package:octattoo_flutter/core/base/base_view_model.dart';
import 'package:octattoo_flutter/src/features/customers/data/repositories/customers_repository.dart';
import 'package:octattoo_flutter/src/features/customers/domain/models/customer.dart';

/// ViewModel for the customers list screen.
class CustomersViewModel extends BaseViewModel {
  CustomersViewModel(this._repository);

  final CustomersRepository _repository;
  List<Customer> _customers = [];
  String _searchQuery = '';

  List<Customer> get customers => List.unmodifiable(_customers);
  String get searchQuery => _searchQuery;

  List<Customer> get filteredCustomers {
    if (_searchQuery.isEmpty) return customers;
    final query = _searchQuery.toLowerCase();
    return _customers
        .where((c) =>
            c.name.toLowerCase().contains(query) ||
            c.email.toLowerCase().contains(query) ||
            (c.phone?.toLowerCase().contains(query) ?? false))
        .toList();
  }

  Future<void> loadCustomers() async {
    await executeAsync(() async {
      _customers = await _repository.getCustomers();
    });
  }

  Future<void> searchCustomers(String query) async {
    _searchQuery = query;
    notifyListeners();
    if (query.isEmpty) {
      await loadCustomers();
    } else {
      await executeAsync(() async {
        _customers = await _repository.searchCustomers(query);
      });
    }
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  Future<void> refresh() => loadCustomers();

  Future<void> deleteCustomer(String id) async {
    await executeAsync(() async {
      await _repository.deleteCustomer(id);
      await loadCustomers();
    });
  }
}
