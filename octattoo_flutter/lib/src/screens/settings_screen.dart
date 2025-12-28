import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Divider(),
          Text(
            'Disconnection'.hardcoded,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              // onPressed: () => client.auth.signOutDevice(),
              onPressed: _isLoading ? null : _handleSignOut,
              child: Text('Sign Out'.hardcoded),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Future<void> _handleSignOut() async {
    final client = ServerpodClientService().client;

    setState(() {
      _isLoading = true;
    });

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _buildLoadingDialog(),
      );

      await client.auth.signOutDevice();

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildLoadingDialog() {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('Signing out...'.hardcoded),
          ],
        ),
      ),
    );
  }
}
