import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';

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
          const Text('Your artist profile is public.'),
          const Text('Set you artist name & choose what you want to show.'),
          gapH12,
          TextFormField(
            controller: _artistNameController,
            decoration: const InputDecoration(
              labelText: 'Your artist name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your artist name';
              }
              return null;
            },
          ),
          gapH20,
          SwitchListTile(
            title: const Text('I want to show my real names'),
            value: _showRealNames,
            onChanged: (value) {
              setState(() {_showRealNames = value;});
            },
          ),
          if (_showRealNames) ...[
            TextFormField(
              controller: _firstnameController,
              decoration: const InputDecoration(
                labelText: 'Firstname',
                border: OutlineInputBorder(),
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your firstname';
              }
              return null;
            },
            ),
            gapH20,
            TextFormField(
              controller: _lastnameController,
              decoration: const InputDecoration(
                labelText: 'Lastname',
                border: OutlineInputBorder(),
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your lastname';
              }
              return null;
            },
            ),
          ],
          SwitchListTile(
            title: const Text('I want to show my pronoun'),
            enableFeedback: true,
            value: _showPronoun,
            onChanged: (value) {
              setState(() {_showPronoun = value;});
            },
          ),
          if (_showPronoun) ...[
            TextFormField(
              controller: _pronounController,
              decoration: const InputDecoration(
                labelText: 'Pronoun',
                border: OutlineInputBorder(),
              ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your pronoun';
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