import 'package:flutter/foundation.dart';

/// Base ViewModel class that extends ChangeNotifier.
/// All ViewModels should extend this class for consistent state management.
///
/// ViewModels are responsible for:
/// - Holding the presentation state
/// - Exposing state via getters
/// - Providing methods to modify state
/// - Notifying listeners when state changes
///
/// ViewModels should NOT:
/// - Depend on Flutter widgets or BuildContext
/// - Contain UI logic or widget building code
/// - Directly make API calls (use repositories instead)
abstract class BaseViewModel extends ChangeNotifier {
  bool _isDisposed = false;
  bool _isLoading = false;
  String? _errorMessage;

  /// Whether this ViewModel is currently loading data
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String? get errorMessage => _errorMessage;

  /// Whether there is an error
  bool get hasError => _errorMessage != null;

  /// Set loading state and notify listeners
  @protected
  void setLoading(bool loading) {
    if (_isDisposed) return;
    _isLoading = loading;
    notifyListeners();
  }

  /// Set error message and notify listeners
  @protected
  void setError(String? error) {
    if (_isDisposed) return;
    _errorMessage = error;
    notifyListeners();
  }

  /// Clear error message
  @protected
  void clearError() {
    if (_isDisposed) return;
    _errorMessage = null;
    notifyListeners();
  }

  /// Safe notify listeners that checks if disposed
  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }

  /// Dispose of resources
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  /// Execute an async operation with automatic loading and error handling
  @protected
  Future<T?> executeAsync<T>(
    Future<T> Function() operation, {
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) setLoading(true);
      clearError();
      final result = await operation();
      return result;
    } catch (e) {
      setError(e.toString());
      return null;
    } finally {
      if (showLoading) setLoading(false);
    }
  }
}
