# Day One: Foundations

**Date:** December 26, 2025
**Author:** FLLAN
**Branch:** `Foundations`

---

## Summary

Formalized the octattoo.app project structure after 2+ years of planning. Established mono-repo, technical stack, brand identity, and documentation foundation.

---

## Added

### Project Structure
- ✅ Initialized GitHub mono-repo ([`aa12374`](https://github.com/Fllan/octattoo.app/commit/aa12374))
- ✅ Created `octattoo_journey/` folder for development documentation
- ✅ Added `octattoo_external_assets/Logo/` with SVG logo files

### Documentation
- ✅ Created [vision-of-FLLAN.md](../vision-of-FLLAN.md) — project vision, values, and technical decisions ([`aa12374`](https://github.com/Fllan/octattoo.app/commit/aa12374))
- ✅ Created [README.md](../README.md) — English documentation ([`3ae4cfa`](https://github.com/Fllan/octattoo.app/commit/3ae4cfa))
- ✅ Created [README.fr.md](../README.fr.md) — French translation ([`099dc23`](https://github.com/Fllan/octattoo.app/commit/099dc23))
- ✅ Added multilingual navigation (🇬🇧 English • 🇫🇷 Français)
- ✅ Created this journal entry ([`9f06ccb`](https://github.com/Fllan/octattoo.app/commit/9f06ccb))

### Backend Setup
- ✅ Initialized Serverpod backend skeleton ([`aa12374`](https://github.com/Fllan/octattoo.app/commit/aa12374))
- ✅ Configured VS Code workspaces ([`c109671`](https://github.com/Fllan/octattoo.app/commit/c109671))
- ✅ Tested authentication flow ([`a1c44d8`](https://github.com/Fllan/octattoo.app/commit/a1c44d8))

### Frontend Development
- ✅ Implemented internationalization (i18n) with Flutter's `intl` package ([`042daf6`](https://github.com/Fllan/octattoo.app/commit/042daf6))
  - Added ARB files for English, French, and Arabic
  - Generated localization classes with proper RTL/LTR support
  - Created l10n extensions for easy access to translations
- ✅ Configured routing with `go_router` ([`049a6a5`](https://github.com/Fllan/octattoo.app/commit/049a6a5))
  - Type-safe route definitions with `go_router_builder`
  - Authentication-aware redirects (redirect to sign-in if not authenticated)
  - Serverpod client service singleton for global session management
- ✅ Restructured app architecture ([`049a6a5`](https://github.com/Fllan/octattoo.app/commit/049a6a5))
  - Migrated from basic screens to organized `src/` structure
  - Created `WelcomeScreen` and `AuthenticationScreen`
  - Integrated Material Design 3 with localization

### Brand Identity
- ✅ Logo: Black ink droplet on yellow folder icon
- ✅ Slogan: "Tattoo & stay organized!"
- ✅ Domain: octattoo.app (owned)

---

## Technical Stack Confirmed

| Component | Technology | Why |
|-----------|------------|-----|
| **Frontend** | [Flutter](https://flutter.dev/) | Cross-platform (mobile, web, desktop), Material Design 3 |
| **Routing** | [go_router](https://pub.dev/packages/go_router) | Declarative routing with type-safety and deep linking |
| **i18n** | [flutter_localizations](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization) | Built-in Flutter i18n with ARB files (EN, FR, AR) |
| **Backend** | [Serverpod](https://serverpod.dev/) | Type-safe Dart backend, built for Flutter |
| **IaC** | [Terraform](https://www.terraform.io/) | Declarative infrastructure management |
| **Hosting** | [OVHCloud](https://www.ovhcloud.com/) | European, GDPR-compliant, cost-effective |
| **Version Control** | GitHub | Mono-repo with transparent open-source development |

📚 **Learn more:**
- [Serverpod docs](https://docs.serverpod.dev/)
- [Flutter docs](https://docs.flutter.dev/)
- [Terraform docs](https://www.terraform.io/docs)

---

## Architecture Decisions

**Mono-repo approach**
- Single repository for frontend, backend, docs, and infrastructure
- Simplifies transparency and contributor onboarding
- Everything version-controlled together

**Open-source commitment**
- All code, documentation, and journey notes public on GitHub
- Users own their data with export capabilities
- Aligns with values: freedom, transparency, progress

**Multilingual from day one**
- French, English, Arabic implemented with Flutter's official i18n tools
- RTL/LTR support baked into architecture with proper text direction handling
- ARB (Application Resource Bundle) format for maintainable translations
- Ensures global accessibility for tattoo community

**Type-safe routing and authentication**
- go_router with code generation for compile-time route safety
- Authentication-aware navigation with automatic redirects
- Serverpod client managed as singleton for consistent session state
- Clear separation between authenticated and public routes

---

## Notes

**For tattoo artists:** The technical foundation ensures the app will be fast, secure, works on all devices, and keeps your data safe.

**For technophiles:** This is a real-world Flutter + Serverpod application built with modern best practices. Follow along to see how it all comes together.

---

**🖤 Made with dedication for the tattoo community**
