import 'package:flutter/material.dart';
import '../../../core/theme/theme_selector_action.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late final TabController _outerTabController;

  @override
  void initState() {
    super.initState();
    _outerTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _outerTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        actions: const [ThemeSelectorAction()],
        bottom: TabBar(
          controller: _outerTabController,
          tabs: const [
            Tab(text: 'NavBar'),
            Tab(text: 'NavRail'),
            Tab(text: 'Tabs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _outerTabController,
        children: const [
          _NavBarDemo(),
          _NavRailDemo(),
          _TabsDemo(),
        ],
      ),
    );
  }
}

class _NavBarDemo extends StatefulWidget {
  const _NavBarDemo();

  @override
  State<_NavBarDemo> createState() => _NavBarDemoState();
}

class _NavBarDemoState extends State<_NavBarDemo> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Selected tab: $_selected',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        NavigationBar(
          selectedIndex: _selected,
          onDestinationSelected: (i) => setState(() => _selected = i),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ],
    );
  }
}

class _NavRailDemo extends StatefulWidget {
  const _NavRailDemo();

  @override
  State<_NavRailDemo> createState() => _NavRailDemoState();
}

class _NavRailDemoState extends State<_NavRailDemo> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selected,
          labelType: NavigationRailLabelType.selected,
          onDestinationSelected: (i) => setState(() => _selected = i),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: Text('Search'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text('Profile'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Center(
            child: Text(
              'Rail selection: $_selected',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ],
    );
  }
}

class _TabsDemo extends StatefulWidget {
  const _TabsDemo();

  @override
  State<_TabsDemo> createState() => _TabsDemoState();
}

class _TabsDemoState extends State<_TabsDemo>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Recent'),
            Tab(text: 'Trending'),
            Tab(text: 'Saved'),
            Tab(text: 'Following'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('Recent content')),
              Center(child: Text('Trending content')),
              Center(child: Text('Saved content')),
              Center(child: Text('Following content')),
            ],
          ),
        ),
      ],
    );
  }
}
