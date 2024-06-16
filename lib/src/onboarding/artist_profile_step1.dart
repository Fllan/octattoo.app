import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

class ArtistProfileStep1 extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const ArtistProfileStep1({super.key, required this.formKey});
  
  @override
  State<ArtistProfileStep1> createState() => _ArtistProfileStep1State();
}

class _ArtistProfileStep1State extends State<ArtistProfileStep1> {
  bool _showRealNames = false;
  bool _showPronoun = false;
  final _artistNameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _pronounController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () => setState(() {}),
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your artist profile is public.'.hardcoded),
          Text('Set you artist name & choose what you want to show.'.hardcoded),
          gapH12,
          TextFormField(
            controller: _artistNameController,
            decoration: InputDecoration(
              labelText: 'Your artist name'.hardcoded,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your artist name'.hardcoded;
              }
              return null;
            },
          ),
          gapH20,
          SwitchListTile(
            title: Text('I want to show my real names'.hardcoded),
            value: _showRealNames,
            onChanged: (value) {
              setState(() {_showRealNames = value;});
            },
          ),
          if (_showRealNames) ...[
            TextFormField(
              controller: _firstnameController,
              decoration: InputDecoration(
                labelText: 'Firstname'.hardcoded,
                border: const OutlineInputBorder(),
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your firstname'.hardcoded;
              }
              return null;
            },
            ),
            gapH20,
            TextFormField(
              controller: _lastnameController,
              decoration: InputDecoration(
                labelText: 'Lastname'.hardcoded,
                border: const OutlineInputBorder(),
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your lastname'.hardcoded;
              }
              return null;
            },
            ),
          ],
          SwitchListTile(
            title: Text('I want to show my pronoun'.hardcoded),
            enableFeedback: true,
            value: _showPronoun,
            onChanged: (value) {
              setState(() {_showPronoun = value;});
            },
          ),
          if (_showPronoun) ...[
            TextFormField(
              controller: _pronounController,
              decoration: InputDecoration(
                labelText: 'Pronoun'.hardcoded,
                border: const OutlineInputBorder(),
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your pronoun'.hardcoded;
              }
              return null;
            },
            ),
          ],
        ],
      ),
    );
  }
}