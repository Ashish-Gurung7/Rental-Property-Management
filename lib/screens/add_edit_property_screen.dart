import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/property_model.dart';
import '../view_models/property_view_model.dart';

class AddEditPropertyScreen extends StatefulWidget {
  final Property? property;
  const AddEditPropertyScreen({super.key, this.property});

  @override
  State<AddEditPropertyScreen> createState() => _AddEditPropertyScreenState();
}

class _AddEditPropertyScreenState extends State<AddEditPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _roomsController;
  late final TextEditingController _revenueController;

  bool get _isEditing => widget.property != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.property?.name ?? '');
    _addressController = TextEditingController(
      text: widget.property?.address ?? '',
    );
    _roomsController = TextEditingController(
      text: widget.property?.totalRooms.toString() ?? '',
    );
    // Extract amount only from "Rs. XXX" if editing
    String revenueText = widget.property?.revenue ?? '';
    if (revenueText.startsWith('Rs. ')) {
      revenueText = revenueText.substring(4);
    }
    _revenueController = TextEditingController(text: revenueText);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _roomsController.dispose();
    _revenueController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      final property = Property(
        id: _isEditing ? widget.property!.id : DateTime.now().toString(),
        name: _nameController.text,
        address: _addressController.text,
        totalRooms: int.parse(_roomsController.text),
        occupied: _isEditing ? widget.property!.occupied : 0,
        vacant: _isEditing
            ? widget.property!.vacant
            : int.parse(_roomsController.text),
        tenantsCount: _isEditing ? widget.property!.tenantsCount : 0,
        revenue: 'Rs. ${_revenueController.text}',
      );

      final viewModel = Provider.of<PropertyViewModel>(context, listen: false);
      if (_isEditing) {
        viewModel.updateProperty(property);
      } else {
        viewModel.addProperty(property);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Property' : 'Add New Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Property Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an address' : null,
              ),
              TextFormField(
                controller: _roomsController,
                decoration: const InputDecoration(labelText: 'Total Rooms'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter room count' : null,
              ),
              TextFormField(
                controller: _revenueController,
                decoration: const InputDecoration(
                  labelText: 'Monthly Revenue (Amount only)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter revenue' : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D5CFF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _isEditing ? 'Update Property' : 'Save Property',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
