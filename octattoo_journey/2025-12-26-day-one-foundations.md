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
- ✅ Initialized GitHub mono-repo (commit `aa12374`)
- ✅ Created `octattoo_journey/` folder for development documentation
- ✅ Added `octattoo_external_assets/Logo/` with SVG logo files

### Documentation
- ✅ Created [vision-of-FLLAN.md](../vision-of-FLLAN.md) — project vision, values, and technical decisions
- ✅ Created [README.md](../README.md) — English documentation
- ✅ Created [README.fr.md](../README.fr.md) — French translation
- ✅ Added multilingual navigation (🇬🇧 English • 🇫🇷 Français)

### Backend Setup
- ✅ Initialized Serverpod backend skeleton
- ✅ Tested authentication flow (commit `a1c44d8`)
- ✅ Configured VS Code workspaces (commit `c109671`)

### Brand Identity
- ✅ Logo: Black ink droplet on yellow folder icon
- ✅ Slogan: "Tattoo & stay organized!"
- ✅ Domain: octattoo.app (owned)

---

## Technical Stack Confirmed

| Component | Technology | Why |
|-----------|------------|-----|
| **Frontend** | [Flutter](https://flutter.dev/) | Cross-platform (mobile, web, desktop), Material Design 3 |
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
- French, English, Arabic planned for launch
- RTL/LTR support baked into architecture
- Ensures global accessibility for tattoo community

---

## Notes

**For tattoo artists:** The technical foundation ensures the app will be fast, secure, works on all devices, and keeps your data safe.

**For technophiles:** This is a real-world Flutter + Serverpod application built with modern best practices. Follow along to see how it all comes together.

---

**🖤 Made with dedication for the tattoo community**
