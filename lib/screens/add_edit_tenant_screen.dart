import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tenant_model.dart';
import '../view_models/tenant_view_model.dart';
import '../view_models/property_view_model.dart';

class AddEditTenantScreen extends StatefulWidget {
  final Tenant? tenant;
  const AddEditTenantScreen({super.key, this.tenant});

  @override
  State<AddEditTenantScreen> createState() => _AddEditTenantScreenState();
}

class _AddEditTenantScreenState extends State<AddEditTenantScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _roomController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _rentController;
  
  String? _selectedProperty;
  late TenantStatus _selectedStatus;

  bool get _isEditing => widget.tenant != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.tenant?.name ?? '');
    _roomController = TextEditingController(text: widget.tenant?.room ?? '');
    _phoneController = TextEditingController(text: widget.tenant?.phone ?? '');
    _emailController = TextEditingController(text: widget.tenant?.email ?? '');
    
    String rentText = widget.tenant?.rent ?? '';
    if (rentText.startsWith('Rs. ')) {
      rentText = rentText.substring(4);
    }
    if (rentText.endsWith('/mo')) {
      rentText = rentText.substring(0, rentText.length - 3);
    }
    _rentController = TextEditingController(text: rentText);
    
    _selectedProperty = widget.tenant?.property;
    _selectedStatus = widget.tenant?.status ?? TenantStatus.pending;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roomController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _rentController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      if (_selectedProperty == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a property')),
        );
        return;
      }

      final tenant = Tenant(
        id: _isEditing ? widget.tenant!.id : DateTime.now().toString(),
        name: _nameController.text,
        property: _selectedProperty!,
        room: _roomController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        rent: 'Rs. ${_rentController.text}/mo',
        status: _selectedStatus,
      );

      final viewModel = Provider.of<TenantViewModel>(context, listen: false);
      if (_isEditing) {
        viewModel.updateTenant(tenant);
      } else {
        viewModel.addTenant(tenant);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final properties = Provider.of<PropertyViewModel>(context).properties;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Tenant' : 'Add New Tenant'),
        actions: _isEditing ? [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Tenant'),
                  content: const Text('Are you sure you want to delete this tenant?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<TenantViewModel>(context, listen: false)
                            .deleteTenant(widget.tenant!.id);
                        Navigator.pop(context); // close dialog
                        Navigator.pop(context); // close screen
                      },
                      child: const Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
          ),
        ] : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedProperty,
                decoration: const InputDecoration(labelText: 'Property'),
                items: properties.map((p) => DropdownMenuItem(
                  value: p.name,
                  child: Text(p.name),
                )).toList(),
                onChanged: (value) => setState(() => _selectedProperty = value),
                validator: (value) => value == null ? 'Please select a property' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _roomController,
                decoration: const InputDecoration(labelText: 'Room Number (e.g. R1)'),
                validator: (value) => value!.isEmpty ? 'Please enter a room' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Please enter a phone number' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _rentController,
                decoration: const InputDecoration(labelText: 'Monthly Rent (Amount only)'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Please enter rent amount' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TenantStatus>(
                value: _selectedStatus,
                decoration: const InputDecoration(labelText: 'Status'),
                items: TenantStatus.values.map((s) => DropdownMenuItem(
                  value: s,
                  child: Text(s.name.toUpperCase()),
                )).toList(),
                onChanged: (value) => setState(() => _selectedStatus = value!),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D5CFF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _isEditing ? 'Update Tenant' : 'Save Tenant',
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
