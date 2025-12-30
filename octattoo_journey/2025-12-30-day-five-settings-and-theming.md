# Day Five: Settings & Theming

**Date:** December 30, 2025
**Author:** FLLAN
**Branch:** `Foundations`

---

## Notes

**For tattoo artists:** The app now lets you customize its appearance with beautiful color themes extracted from artwork images. You can choose between different artistic palettes (Bamboo, Lampsane, Cyanotypes, Goddess) that automatically adjust the app's colors. The settings menu is now better organized with clear sections for different tools like invoices, quotes, and inventory management.

**For technophiles:** Implemented Material 3's [content-based dynamic color](https://m3.material.io/styles/color/dynamic/content-based-source) system using `ColorScheme.fromImageProvider()`. Refactored state management by consolidating locale and theme controllers into a unified `AppSettings` notifier pattern. Added path-based URL strategy for web deployment, removing hash fragments from URLs for better SEO and cleaner navigation.

---

## Summary

Unified application state management by consolidating theme and locale settings, implemented Material 3 dynamic color theming with image-based color extraction, enhanced settings UI with better organization, and improved web navigation with path-based URL strategy.

---

## Added

### State Management Refactoring
- ✅ Consolidated locale and theme management into unified `AppSettings` system ([`44f4b08`](https://github.com/Fllan/octattoo.app/commit/44f4b08))
  - Created `AppSettings` value object holding theme mode, locale, and color image
  - Created `AppSettingsNotifier` as single source of truth for all app-wide settings
  - Created `AppSettingsRepository` and `AppSettingsProvider` for settings persistence
  - Removed separate `LocaleController`, `LocaleProvider`, `ThemeController`, and `ThemeProvider`
  - Reduced code complexity from 278 lines to 252 lines while adding new features
- ✅ Added color scheme image assets for dynamic theming ([`44f4b08`](https://github.com/Fllan/octattoo.app/commit/44f4b08))
  - Added `lepetiroi-bamboo-yellow-blue.jpg` (default)
  - Added `lepetiroi-lampsane-blue-yellow.jpg`
  - Added `lepetiroi-cyanotypes-green-white.jpg`
  - Added `lepetiroi-aurore-thill-white-warm.jpg`

### Dynamic Color Theming
- ✅ Implemented Material 3 content-based color scheme extraction ([`62c8643`](https://github.com/Fllan/octattoo.app/commit/62c8643))
  - Color schemes extracted from artwork images using `ColorScheme.fromImageProvider()`
  - Separate light and dark color schemes generated for each image
  - Color extraction happens asynchronously and caches results
  - Automatic theme updates when color image changes
- ✅ Created `ColorImage` enum for managing theme artwork ([`44f4b08`](https://github.com/Fllan/octattoo.app/commit/44f4b08))
  - Four curated artwork options with display names
  - Asset path management for each image
  - Type-safe image selection in settings

### UI/UX Improvements
- ✅ Enhanced More screen with organized sections ([`88e25a8`](https://github.com/Fllan/octattoo.app/commit/88e25a8))
  - Added "Finance" section (Quotes, Invoices, Payments)
  - Added "Hygiene & Cleanliness" section (Traceability, Inventory)
  - Added "Settings" section
  - Added logout functionality with visual error color coding
  - Improved visual hierarchy with section headers and dividers
- ✅ Redesigned settings screen with color theme picker ([`34c96de`](https://github.com/Fllan/octattoo.app/commit/34c96de))
  - Added visual color theme selector with preview cards
  - Improved theme mode toggle with radio buttons
  - Enhanced locale selection UI
  - Better organization and visual feedback

### Navigation Enhancement
- ✅ Added path-based URL strategy for web ([`30710c7`](https://github.com/Fllan/octattoo.app/commit/30710c7))
  - Implemented `usePathUrlStrategy()` to remove hash fragments from URLs
  - Added `flutter_web_plugins` dependency
  - Cleaner URLs for better SEO and user experience (e.g., `/settings` instead of `/#/settings`)

---

## Technical Implementation

### Unified State Management Architecture

The previous architecture had separate controllers for theme and locale:
```
Before:
├─ LocaleController + LocaleProvider + LocaleRepository
└─ ThemeController + ThemeProvider + ThemeRepository
```

The new architecture consolidates everything into a single settings system:
```
After:
└─ AppSettingsNotifier + AppSettingsProvider + AppSettingsRepository
```

**AppSettings Value Object:**
```dart
class AppSettings {
  const AppSettings({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
    this.colorImage = ColorImage.bambooYellowBlue,
  });

  AppSettings copyWith({ThemeMode? themeMode, Locale? locale, ColorImage? colorImage});
}
```

**AppSettingsNotifier:**
```dart
class AppSettingsNotifier extends ChangeNotifier {
  AppSettings _settings = const AppSettings();
  ColorScheme? _lightColorScheme;
  ColorScheme? _darkColorScheme;

  Future<void> setThemeMode(ThemeMode mode) async { /* ... */ }
  Future<void> setLocale(Locale locale) async { /* ... */ }
  Future<void> setColorImage(ColorImage image) async {
    _settings = _settings.copyWith(colorImage: image);
    await _extractColorScheme(image);  // Extract colors from new image
    notifyListeners();
  }
}
```

This pattern provides:
- **Single source of truth** for all app-wide settings
- **Immutable state snapshots** via `AppSettings` value object
- **Async color extraction** that doesn't block the UI
- **Cached color schemes** to avoid re-extracting on every rebuild

### Material 3 Dynamic Color Extraction

The app uses Flutter's built-in `ColorScheme.fromImageProvider()` to extract dominant colors from artwork:

```dart
Future<void> _extractColorScheme(ColorImage image) async {
  _lightColorScheme = await ColorScheme.fromImageProvider(
    provider: AssetImage(image.assetPath),
    brightness: Brightness.light,
  );
  _darkColorScheme = await ColorScheme.fromImageProvider(
    provider: AssetImage(image.assetPath),
    brightness: Brightness.dark,
  );
}
```

**Color Extraction Process:**
1. User selects an artwork from settings
2. `AppSettingsNotifier.setColorImage()` is called
3. Async color extraction begins for both light and dark modes
4. Extracted `ColorScheme` objects are cached in the notifier
5. `OctattooApp` rebuilds with new themes using `AppThemeData.fromColorScheme()`

**Theme Application:**
```dart
// In OctattooApp
MaterialApp.router(
  theme: settingsNotifier.lightColorScheme != null
    ? AppThemeData.fromColorScheme(settingsNotifier.lightColorScheme!)
    : AppThemeData.defaultLight,
  darkTheme: settingsNotifier.darkColorScheme != null
    ? AppThemeData.fromColorScheme(settingsNotifier.darkColorScheme!)
    : AppThemeData.defaultDark,
)
```

### Settings UI with Visual Theme Picker

The settings screen now includes a visual color theme picker:

```dart
// Color theme options displayed as cards
Column(
  children: ColorImage.values.map((colorImage) =>
    Card(
      child: ListTile(
        leading: Image.asset(colorImage.assetPath, width: 48, height: 48),
        title: Text(colorImage.displayName),
        selected: currentImage == colorImage,
        onTap: () => settingsNotifier.setColorImage(colorImage),
      ),
    ),
  ).toList(),
)
```

Each option shows:
- Preview of the artwork image
- Display name (Bamboo, Lampsane, etc.)
- Visual selection indicator
- Tap to apply the new color scheme

### More Screen Organization

The More screen uses semantic grouping with visual hierarchy:

```dart
Column(
  children: [
    // Section header
    MaterialText.titleSmall('Finance', context),
    gapH12,

    // Section items
    ListTile(leading: Icon(Icons.request_quote_outlined), ...),
    ListTile(leading: Icon(Icons.receipt_long_outlined), ...),

    Divider(),

    // Next section...
  ],
)
```

Features:
- **Semantic grouping:** Finance, Hygiene, Settings
- **Visual hierarchy:** Headers, gaps, dividers
- **Icon consistency:** Outlined icons throughout
- **Color-coded actions:** Logout uses error color to signal destructive action

### Path-based URL Strategy

Web apps using `go_router` default to hash-based URLs (`/#/path`). Path-based strategy provides cleaner URLs:

```dart
// In main.dart
void main() async {
  usePathUrlStrategy();  // Removes # from URLs
  WidgetsFlutterBinding.ensureInitialized();
  // ...
}
```

**Benefits:**
- **SEO-friendly:** Search engines prefer clean URLs
- **User experience:** URLs look professional (`/settings` vs `/#/settings`)
- **Deep linking:** Better integration with web platform
- **Bookmarkability:** Cleaner URLs are easier to share and bookmark

**Trade-off:** Requires server configuration to redirect all routes to `index.html` (not needed for client-side routing during development).

---

## Architecture Decisions

**Unified settings management over separate controllers**
- Reduces boilerplate (removed 6 files, added 3 more powerful ones)
- Single source of truth prevents state synchronization bugs
- Easier to add new settings (just extend `AppSettings` value object)
- Simpler dependency injection (one provider instead of multiple)
- Related settings are naturally grouped together

**Immutable AppSettings value object pattern**
- Predictable state updates (copyWith pattern)
- Easy to test (pure value object with equality)
- Safe to pass around (can't be mutated accidentally)
- Works well with Flutter's rebuild mechanism
- Enables time-travel debugging and undo/redo patterns

**Content-based dynamic color over fixed color schemes**
- Allows unique, brand-aligned color palettes from artwork
- Automatically generates accessible color combinations
- Material 3 system ensures proper contrast ratios
- Users can customize app appearance without designer intervention
- Differentiates from apps using generic Material You colors
- Aligns with artistic nature of tattoo industry

**Async color extraction with caching**
- Color extraction from images is expensive (image processing)
- Async prevents blocking UI during extraction
- Caching avoids re-extraction on every rebuild or app restart
- Provides fallback default theme during initial extraction
- Smooth user experience even when switching themes

**Section-based More screen over flat list**
- Improves information architecture and scannability
- Groups related features for faster navigation
- Allows for future expansion within each section
- Familiar pattern from iOS Settings and other mobile apps
- Reduces cognitive load by chunking related items

**Path-based URLs for web deployment**
- Professional appearance for web version
- Better for marketing and sharing links
- Improved SEO if app becomes publicly accessible
- Modern web standard (SPAs moving away from hash routing)
- Negligible cost (just one line of code and server config)

**Visual theme picker over text-only list**
- Users can see actual artwork before selecting
- More engaging and interactive experience
- Aligns with visual nature of tattoo artistry
- Immediate preview of what the theme represents
- Reduces decision paralysis (visual cues help)

---

**🖤 Made with dedication for the tattoo community**
