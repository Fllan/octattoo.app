# Day Two: Navigation & App Structure

**Date:** December 27, 2025
**Author:** FLLAN
**Branch:** `Foundations`

---

## Summary

Built the core navigation architecture with stateful shell routing, drawer navigation, and main app screens. Established the foundational user experience for authenticated tattoo artists.

---

## Added

### Navigation System
- ✅ Implemented stateful shell route with `go_router` ([`e495c5c`](https://github.com/Fllan/octattoo.app/commit/e495c5c))
- ✅ Created `ScaffoldWithModalDrawer` widget for consistent navigation
- ✅ Added `NavDestination` model for type-safe navigation configuration
- ✅ Integrated `IndexedStack` for state preservation across navigation

### Main App Screens
- ✅ Created `CustomersScreen` — manage client information ([`e495c5c`](https://github.com/Fllan/octattoo.app/commit/e495c5c))
- ✅ Created `AppointmentsScreen` — schedule and track sessions ([`e495c5c`](https://github.com/Fllan/octattoo.app/commit/e495c5c))
- ✅ Created `ArtistProfileScreen` — artist portfolio and details ([`e495c5c`](https://github.com/Fllan/octattoo.app/commit/e495c5c))
- ✅ Created `SettingsScreen` — app configuration ([`e495c5c`](https://github.com/Fllan/octattoo.app/commit/e495c5c))

### Code Organization
- ✅ Restructured to `src/navigation/` for navigation components
- ✅ Moved l10n extensions to `src/shared/` for better organization
- ✅ Updated routing configuration with stateful shell branches
- ✅ Added `.gitignore` entry for local TODO.md files

---

## Technical Implementation

### Stateful Shell Route
Implemented using `go_router`'s `StatefulShellRoute` with:
- **Branch-based navigation:** Each main screen has its own navigation branch
- **State preservation:** `IndexedStack` maintains screen state when switching tabs
- **Modal drawer:** Material Design 3 `NavigationDrawer` for main navigation
- **Dynamic AppBar:** Title updates based on current navigation destination

### Navigation Architecture
```
StatefulShellRoute
├─ Branch: Customers (index 0)
├─ Branch: Appointments (index 1)
├─ Branch: Artist Profile (index 2)
└─ Branch: Settings (index 3)
```

Each branch maintains its own navigation state, allowing users to navigate within sections without losing context.

### Code Structure
```
octattoo_flutter/lib/
├─ src/
│  ├─ navigation/
│  │  ├─ nav_destination.dart      # Navigation configuration model
│  │  └─ scaffold_with_modal_drawer.dart  # Main scaffold wrapper
│  ├─ screens/
│  │  ├─ customers_screen.dart
│  │  ├─ appointments_screen.dart
│  │  ├─ artist_profile_screen.dart
│  │  └─ settings_screen.dart
│  └─ shared/
│     └─ l10n_extensions.dart      # Localization utilities
└─ core/
   └─ router/
      ├─ routes.dart                # Route definitions
      └─ redirect.dart              # Authentication redirects
```

---

## Architecture Decisions

**Stateful navigation over bottom navigation bar**
- Drawer allows more navigation items without UI crowding
- Better support for future expansion (e.g., Reports, Gallery, etc.)
- Familiar pattern for mobile users
- Easier to add sub-navigation within branches

**IndexedStack for state preservation**
- Keeps screens alive when switching navigation
- Prevents data loss during navigation
- Better UX: forms, scroll positions, etc. are preserved
- Small memory trade-off acceptable for 4 main screens

**Type-safe navigation model**
- `NavDestination` class ensures consistency
- Single source of truth for navigation configuration
- Easy to maintain and extend
- Icons and labels centralized

**Branch-based routing**
- Each section can have its own nested navigation
- Supports deep linking within sections
- Clean separation of concerns
- Scales well as features grow

---

## Next Steps

**Immediate priorities:**
- Implement actual UI for each screen (currently placeholders)
- Add proper localization to navigation labels (currently hardcoded)
- Design data models for Customers, Appointments, and Artist Profile
- Connect screens to Serverpod backend

**Future considerations:**
- Add search functionality to Customers and Appointments
- Implement filters and sorting
- Add quick actions to drawer (e.g., "New Appointment")
- Consider adding a dashboard/home screen as the landing page

---

## Notes

**For tattoo artists:** The app now has its main navigation structure. You'll have dedicated sections for managing clients, scheduling appointments, showcasing your work, and configuring the app.

**For technophiles:** This implements the stateful shell route pattern from `go_router`, providing branch-based navigation with state preservation. Reference implementation: [go_router stateful shell example](https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart)

---

**🖤 Made with dedication for the tattoo community**
