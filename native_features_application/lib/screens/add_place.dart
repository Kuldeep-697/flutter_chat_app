import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_features_application/providers/user_places.dart';
import 'package:native_features_application/widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final controller = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = controller.text;

    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _selectedImage!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),

        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground
              )
            ),

            const SizedBox(height: 20),

            ImageInput(
              onPickImage : (image) {
                _selectedImage = image;
              }
            ),

            const SizedBox(height: 20),

            //const LocationInput(),

            const SizedBox(height: 20),
            
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add place'),
            )
          ],
        ),
      ),
    );
  }
}
