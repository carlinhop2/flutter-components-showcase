import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Section(
              title: 'Filled & Elevated',
              children: [
                FilledButton(onPressed: null, child: Text('Filled Disabled')),
                FilledButton(onPressed: _noop, child: Text('Filled')),
                ElevatedButton(onPressed: _noop, child: Text('Elevated')),
                ElevatedButton.icon(
                  onPressed: _noop,
                  icon: Icon(Icons.add),
                  label: Text('With Icon'),
                ),
                ElevatedButton(onPressed: null, child: Text('Disabled')),
              ],
            ),
            _Section(
              title: 'Outlined & Text',
              children: [
                OutlinedButton(onPressed: _noop, child: Text('Outlined')),
                OutlinedButton(onPressed: null, child: Text('Disabled')),
                TextButton(onPressed: _noop, child: Text('Text Button')),
                TextButton(onPressed: null, child: Text('Disabled')),
              ],
            ),
            _Section(
              title: 'Icon Buttons',
              children: [
                IconButton(onPressed: _noop, icon: Icon(Icons.favorite_border)),
                IconButton.filled(
                    onPressed: _noop, icon: Icon(Icons.favorite)),
                IconButton.filledTonal(
                    onPressed: _noop, icon: Icon(Icons.bookmark_border)),
                IconButton.outlined(
                    onPressed: _noop, icon: Icon(Icons.share_outlined)),
              ],
            ),
            _Section(
              title: 'FAB',
              children: [
                FloatingActionButton.small(
                  heroTag: 'fab-small',
                  onPressed: _noop,
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'fab-regular',
                  onPressed: _noop,
                  child: Icon(Icons.edit),
                ),
                FloatingActionButton.large(
                  heroTag: 'fab-large',
                  onPressed: _noop,
                  child: Icon(Icons.camera_alt),
                ),
                FloatingActionButton.extended(
                  heroTag: 'fab-extended',
                  onPressed: _noop,
                  icon: Icon(Icons.send),
                  label: Text('Send'),
                ),
              ],
            ),
            _SegmentedButtonDemo(),
          ],
        ),
      ),
    );
  }
}

void _noop() {}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(spacing: 12, runSpacing: 12, children: children),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _SegmentedButtonDemo extends StatefulWidget {
  const _SegmentedButtonDemo();

  @override
  State<_SegmentedButtonDemo> createState() => _SegmentedButtonDemoState();
}

class _SegmentedButtonDemoState extends State<_SegmentedButtonDemo> {
  String _selected = 'day';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text('Segmented Button', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: 'day', label: Text('Day')),
            ButtonSegment(value: 'week', label: Text('Week')),
            ButtonSegment(value: 'month', label: Text('Month')),
          ],
          selected: {_selected},
          onSelectionChanged: (s) => setState(() => _selected = s.first),
        ),
      ],
    );
  }
}
