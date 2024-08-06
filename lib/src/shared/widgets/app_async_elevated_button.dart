import 'package:flutter/material.dart';

class AppAsyncElevatedButton extends StatefulWidget {
  const AppAsyncElevatedButton({
    super.key,
    required this.callback,
    required this.label,
  });

  final Future<void> Function() callback;
  final String label;

  @override
  State<AppAsyncElevatedButton> createState() => _AppAsyncElevatedButtonState();
}

class _AppAsyncElevatedButtonState extends State<AppAsyncElevatedButton> {
  bool _isLoading = false;
  late String label;
  late Function() callback;

  @override
  void initState() {
    super.initState();
    label = widget.label;
    callback = widget.callback;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : onPressed,
      child: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            )
          : Text(label),
    );
  }

  void onPressed() async {
    setState(() {
      _isLoading = true;
    });
    await callback();
    setState(() {
      _isLoading = false;
    });
  }
}
