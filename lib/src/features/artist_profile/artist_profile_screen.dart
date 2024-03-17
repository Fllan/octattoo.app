import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/language/localization.dart';

class ArtistProfileScreen extends ConsumerWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.artistProfileTitle),),
    );
  }
}