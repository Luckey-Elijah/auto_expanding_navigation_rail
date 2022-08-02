# auto_expanding_navigation_rail

An example project of how to add an "auto expanding" navigation rail.

## tldr;

Wrap a `NavigationRail` in a `MouseRegion`:

```dart
MouseRegion(
  onEnter: (_) => setState(() => expanded = true),
  onExit: (_) => setState(() => expanded = false),
  child: NavigationRail(
    destinations: [ ... ],
    selectedIndex: index,
    extended: expanded,
    onDestinationSelected: (i) => setState(() => index = i),
  ),
)
```

![](auto-nav-rail.mov.gif)
