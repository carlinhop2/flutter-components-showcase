import 'dart:math' show pi;

import 'package:flutter/material.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen>
    with TickerProviderStateMixin {
  // AnimatedContainer
  bool _containerExpanded = false;

  // AnimatedOpacity
  bool _visible = true;

  // Rotation
  late final AnimationController _rotationController;

  // Bounce
  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _bounceAnimation = Tween<double>(begin: 0, end: -80).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.bounceOut),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. AnimatedContainer
          _SectionHeader('AnimatedContainer'),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => setState(() => _containerExpanded = !_containerExpanded),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: _containerExpanded ? 300 : 120,
              height: _containerExpanded ? 120 : 60,
              decoration: BoxDecoration(
                color: _containerExpanded ? cs.primaryContainer : cs.secondaryContainer,
                borderRadius: BorderRadius.circular(_containerExpanded ? 24 : 8),
              ),
              child: Center(
                child: Text(
                  'Tap me',
                  style: TextStyle(color: cs.onPrimaryContainer),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // 2. AnimatedOpacity
          _SectionHeader('AnimatedOpacity'),
          const SizedBox(height: 8),
          Row(
            children: [
              FilledButton(
                onPressed: () => setState(() => _visible = !_visible),
                child: Text(_visible ? 'Hide' : 'Show'),
              ),
              const SizedBox(width: 16),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: cs.tertiaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 3. Continuous rotation
          _SectionHeader('Continuous Rotation'),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _rotationController,
            builder: (_, child) => Transform.rotate(
              angle: _rotationController.value * 2 * pi,
              child: child,
            ),
            child: Icon(Icons.settings, size: 64, color: cs.primary),
          ),

          const SizedBox(height: 24),

          // 4. Bounce
          _SectionHeader('Bounce'),
          const SizedBox(height: 8),
          Row(
            children: [
              FilledButton(
                onPressed: () {
                  _bounceController.forward(from: 0);
                },
                child: const Text('Bounce!'),
              ),
              const SizedBox(width: 16),
              AnimatedBuilder(
                animation: _bounceAnimation,
                builder: (_, child) => Transform.translate(
                  offset: Offset(0, _bounceAnimation.value),
                  child: child,
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: cs.errorContainer,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 5. Hero transition
          _SectionHeader('Hero Transition'),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const _HeroDetailPage(),
              ),
            ),
            child: Hero(
              tag: 'hero-box',
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.star, color: cs.onPrimaryContainer, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text('Tap the box to see the Hero animation'),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }
}

class _HeroDetailPage extends StatelessWidget {
  const _HeroDetailPage();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Detail')),
      body: Center(
        child: Hero(
          tag: 'hero-box',
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(Icons.star, color: cs.onPrimaryContainer, size: 120),
          ),
        ),
      ),
    );
  }
}
