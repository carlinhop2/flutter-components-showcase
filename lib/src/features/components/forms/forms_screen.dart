import 'package:flutter/material.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  bool _check1 = false;
  bool _check2 = true;
  bool _switch1 = false;
  bool _switch2 = true;
  double _sliderValue = 40;
  String _selectedFruit = 'Apple';
  DateTime? _selectedDate;

  static const List<String> _fruits = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Forms')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text('Checkboxes', style: theme.textTheme.titleMedium),
          ),
          CheckboxListTile(
            title: const Text('Option A'),
            value: _check1,
            onChanged: (v) => setState(() => _check1 = v ?? false),
          ),
          CheckboxListTile(
            title: const Text('Option B'),
            value: _check2,
            onChanged: (v) => setState(() => _check2 = v ?? false),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text('Switches', style: theme.textTheme.titleMedium),
          ),
          SwitchListTile(
            title: const Text('Dark mode'),
            value: _switch1,
            onChanged: (v) => setState(() => _switch1 = v),
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            value: _switch2,
            onChanged: (v) => setState(() => _switch2 = v),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'Slider — value: ${_sliderValue.round()}',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            divisions: 20,
            label: _sliderValue.round().toString(),
            onChanged: (v) => setState(() => _sliderValue = v),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text('Dropdown Menu', style: theme.textTheme.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownMenu<String>(
              initialSelection: _selectedFruit,
              label: const Text('Fruit'),
              dropdownMenuEntries: _fruits
                  .map((f) => DropdownMenuEntry(value: f, label: f))
                  .toList(),
              onSelected: (v) => setState(() => _selectedFruit = v ?? _selectedFruit),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              _selectedDate == null
                  ? 'Date Picker'
                  : 'Date Picker — ${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButton.icon(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) setState(() => _selectedDate = picked);
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text('Pick a date'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
