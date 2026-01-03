# Day Six: Architecture Exploration & Model Foundation

**Date:** January 3, 2026
**Author:** FLLAN
**Branch:** `Foundations`

---

## Notes

**For tattoo artists:** Behind the scenes work on how the app is organized internally. Think of it like rearranging your workspace - sometimes you try a new layout, realize it's not quite right, and go back to what works while keeping the good ideas for later. The important outcome is that the system can now properly track tattoo artists in the database with their profiles, bios, and images.

**For technophiles:** Explored implementing full MVVM architecture with repository pattern, base classes, and service locator pattern. Created comprehensive research documentation (2,481 lines) covering Serverpod integration, state management patterns, and clean architecture principles. After implementation experiments across multiple features, chose to revert and take a more incremental approach. Established first domain model (TattooArtist) with proper Serverpod integration, database schema, and cascade deletion. Reference: [MVVM Architecture in Flutter](https://docs.flutter.dev/data-and-backend/state-mgmt/options#changenotifier--changenotifierprovider).

---

## Summary

Conducted architectural research on MVVM patterns for Flutter + Serverpod integration, experimented with full implementation across features, strategically reverted to maintain stability, and established the foundational TattooArtist data model with complete backend integration.

---

## Added

### Architecture Research
- ✅ Created comprehensive MVVM architecture documentation ([`ba329cf`](https://github.com/Fllan/octattoo.app/commit/ba329cf))
  - 2,481-line research document covering MVVM pattern for Flutter + Serverpod
  - Layered architecture approach (Presentation → Business Logic → Data)
  - Repository pattern for data abstraction
  - State management with ChangeNotifier (built-in Flutter)
  - Authentication state management patterns
  - Real-time updates with Streams
  - Error handling strategies
  - Client-side caching strategies
  - Migration path from current architecture

### Architecture Experimentation (Reverted)
- ✅ Implemented MVVM architecture across core features ([`6bc41cc`](https://github.com/Fllan/octattoo.app/commit/6bc41cc), reverted in [`55db05f`](https://github.com/Fllan/octattoo.app/commit/55db05f))
  - Created `BaseRepository` and `BaseViewModel` abstract classes
  - Implemented service locator pattern with dependency injection
  - Restructured Appointments feature with full MVVM layers
  - Restructured Customers feature with full MVVM layers
  - Restructured Projects feature with full MVVM layers
  - Added mock repositories for all features
- ✅ Continued MVVM refactoring with presentation layer organization ([`faa41b4`](https://github.com/Fllan/octattoo.app/commit/faa41b4), reverted in [`55db05f`](https://github.com/Fllan/octattoo.app/commit/55db05f))
  - Moved screens into `presentation/screens/` folders for all features
  - Organized artist profile, authentication, customers, inventory, invoices, quotes, and settings

### Strategic Reversion
- ✅ Reverted MVVM implementation commits to return to stable state ([`55db05f`](https://github.com/Fllan/octattoo.app/commit/55db05f))
  - Retained architecture research documentation
  - Removed experimental implementation
  - Preserved simpler, working codebase
  - Maintained foundation for future incremental adoption

### Data Model Development
- ✅ Implemented TattooArtist model and database integration ([`b8cdb08`](https://github.com/Fllan/octattoo.app/commit/b8cdb08))
  - Created `TattooArtist` model via Serverpod YAML definition
  - Database table with `auth_user_id` unique index
  - Relation to `AuthUser` with cascade deletion
  - Profile fields: `artistName`, `bio`, `pictureUrl`, `bannerUrl`
  - Generated client-side model classes
  - Generated server-side model and repository classes
  - Created database migration (20260103214634055)
  - Updated protocol registration

---

## Technical Implementation

### MVVM Architecture Research

The research document established a complete architectural blueprint for the application:

**Layered Architecture:**
```
┌──────────────┐         ┌──────────────────┐         ┌─────────────────────┐
│     View     │ ◄────── │   ViewModel      │ ◄────── │   Model (Data)      │
│    (UI)      │         │(Business Logic)  │         │                     │
└──────────────┘         └──────────────────┘         └─────────────────────┘
      │                          │                              │
      │                          │                              │
 StatefulWidget           ChangeNotifier                 Repository Layer
 InheritedNotifier        State Management                      │
 Widgets                  Validation                            │
 ListenableBuilder        Commands                              ▼
                                                      ┌─────────────────────┐
                                                      │  Serverpod Client   │
                                                      │  (Generated Code)   │
                                                      └─────────────────────┘
                                                               │
                                                               ▼
                                                      ┌─────────────────────┐
                                                      │  Serverpod Server   │
                                                      │    (Backend)        │
                                                      └─────────────────────┘
```

**Key Principles Documented:**
1. View knows about ViewModel, but not Model or Serverpod Client
2. ViewModel knows about Repository, but not View or Serverpod Client
3. Repository wraps Serverpod Client and abstracts data access
4. Model classes generated by Serverpod from `.spy.yaml` files
5. Communication flows: View → ViewModel → Repository → Serverpod Client → Server
6. Data flows back: Server → Client → Repository → ViewModel → View

**Technologies Selected:**
- Built-in Flutter (`ChangeNotifier`, `InheritedNotifier`, `ValueListenable`)
- Serverpod client as Data Layer
- No external state management packages
- No dependency injection frameworks

### MVVM Implementation Attempt

The implementation created a complete layered structure:

**Base Classes Created:**
```dart
// Base repository with common data operations
abstract class BaseRepository {
  Future<T?> getById<T>(int id);
  Future<List<T>> getAll<T>();
  Future<T> create<T>(T entity);
  Future<T> update<T>(T entity);
  Future<void> delete(int id);
}

// Base ViewModel with common state management
abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  @protected
  Future<void> runWithLoading(Future<void> Function() action);
}
```

**Feature Implementation Example (Appointments):**
```
lib/src/features/appointments/
├── data/
│   └── repositories/
│       ├── appointments_repository.dart (interface)
│       └── mock_appointments_repository.dart (implementation)
├── domain/
│   └── models/
│       └── appointment.dart
└── presentation/
    ├── screens/
    │   ├── appointments_screen.dart
    │   └── appointment_details_screen.dart
    └── view_models/
        ├── appointments_view_model.dart
        └── appointment_details_view_model.dart
```

**Service Locator Pattern:**
```dart
class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  // Repositories
  final appointmentsRepository = MockAppointmentsRepository();
  final customersRepository = MockCustomersRepository();
  final projectsRepository = MockProjectsRepository();
}
```

This implementation touched 28 files with 1,957 additions and 2,677 deletions.

### Strategic Decision: Revert

After implementing MVVM across multiple features, the decision was made to revert:

**Reasons for Reversion:**
- **Scope too large:** Changing entire architecture in one step affects all features simultaneously
- **Risk management:** Hard to test and validate architectural changes when everything changes at once
- **Incremental value:** Research document provides blueprint for future gradual adoption
- **Current simplicity:** Existing simpler architecture works and is understood
- **Learning preservation:** Research document retained for future reference

**What Was Kept:**
- `MVVM.md` research documentation (2,481 lines)
- Understanding of Serverpod + MVVM integration patterns
- Blueprint for future architectural evolution

**What Was Removed:**
- Base classes (`BaseRepository`, `BaseViewModel`)
- Service locator and dependency injection
- Reorganized folder structure
- Mock repositories
- Domain models layer

### TattooArtist Model Implementation

After architectural reset, focused on foundational model:

**Serverpod YAML Definition (`tattoo_artist.spy.yaml`):**
```yaml
class: TattooArtist
table: tattoo_artist
fields:
    authUser: module:serverpod_auth_core:AuthUser?, relation(onDelete=Cascade)
    artistName: String, default=''
    bio: String, default=''
    pictureUrl: String, default=''
    bannerUrl: String, default=''

indexes:
  auth_user_id_unique_idx:
    fields: authUserId
    unique: true
```

**Generated Model Structure:**
```dart
abstract class TattooArtist implements SerializableModel {
  int? id;                        // Database primary key
  UuidValue authUserId;           // Foreign key to AuthUser
  AuthUser? authUser;             // Relation object
  String artistName;              // Display name
  String bio;                     // Artist bio/description
  String pictureUrl;              // Profile picture URL
  String bannerUrl;               // Profile banner URL

  TattooArtist copyWith({...});   // Immutable updates
  Map<String, dynamic> toJson();  // Serialization
  factory TattooArtist.fromJson(Map<String, dynamic> json);
}
```

**Database Schema (migration):**
```sql
CREATE TABLE "tattoo_artist" (
  "id" bigserial PRIMARY KEY,
  "authUserId" uuid NOT NULL,
  "artistName" text NOT NULL DEFAULT '',
  "bio" text NOT NULL DEFAULT '',
  "pictureUrl" text NOT NULL DEFAULT '',
  "bannerUrl" text NOT NULL DEFAULT ''
);

CREATE UNIQUE INDEX "auth_user_id_unique_idx"
  ON "tattoo_artist" USING btree ("authUserId");

ALTER TABLE ONLY "tattoo_artist"
  ADD CONSTRAINT "tattoo_artist_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user_info"("id")
    ON DELETE CASCADE;
```

**Key Design Decisions:**
1. **One-to-one relationship:** Each AuthUser can have exactly one TattooArtist profile (unique index)
2. **Cascade deletion:** Deleting AuthUser automatically deletes TattooArtist profile
3. **Default empty strings:** All text fields default to '' rather than null for simpler client handling
4. **Optional AuthUser relation:** Allows lazy loading or fetching without related AuthUser
5. **UUID for user reference:** Uses Serverpod's AuthUser UUID system

**Generated Code Coverage:**
- Client-side model: `octattoo_client/lib/src/protocol/features/tattoo_artist/tattoo_artist.dart` (155 lines)
- Server-side model: `octattoo_server/lib/src/generated/features/tattoo_artist/tattoo_artist.dart` (629 lines)
- Protocol registration updated to include TattooArtist serialization
- Database migration created with rollback support

---

## Architecture Decisions

**Comprehensive research before implementation**
- Created 2,481-line architecture document before coding
- Researched Serverpod-specific patterns and recommendations
- Documented state management integration patterns
- Established clear migration path from current to target architecture
- Provides reference for future architectural evolution

**Attempting full MVVM implementation in one step**
- Tested feasibility of complete architectural refactor
- Validated understanding of MVVM patterns with real code
- Identified scope and complexity of full migration
- Revealed dependencies between features and architecture layers
- Provided hands-on learning about Serverpod + MVVM integration

**Choosing to revert rather than push forward**
- Recognized value of incremental architectural change
- Preserved working, understood codebase over experimental complexity
- Avoided "big bang" refactor risk
- Maintained project velocity by not blocking feature development
- Demonstrated pragmatic decision-making over sunk cost fallacy
- Research document provides roadmap for gradual adoption when needed

**Retaining architecture research documentation**
- Creates knowledge asset for team/future development
- Documents "why" behind potential future architectural changes
- Serves as onboarding material for new developers
- Captures investigation effort even though implementation was reverted
- Enables informed discussion of architecture evolution

**Starting model foundation with TattooArtist**
- Establishes core domain entity for the application
- Links authentication to artist profiles properly
- Creates foundation for artist-centric features (portfolio, bookings, etc.)
- Validates Serverpod model generation and migration workflow
- Simplest possible starting point for data model layer

**One-to-one AuthUser to TattooArtist relationship**
- Each authenticated user is exactly one tattoo artist
- Simplifies authorization (authenticated = artist = authorized)
- Avoids complex role/permission systems initially
- Unique index enforces this constraint at database level
- Can be extended later for multi-role support if needed

**Cascade deletion for artist profiles**
- Maintains referential integrity automatically
- Deleting user account removes all associated artist data
- Prevents orphaned artist records
- Aligns with GDPR/data deletion requirements
- Reduces manual cleanup logic

**Default empty strings over nullable strings**
- Simpler client code (no null checks for display fields)
- UI can safely display artistName, bio, etc., without null coalescing
- Empty string vs null has semantic difference: "field exists but empty" vs "field doesn't exist"
- Aligns with form fields which typically start empty
- Reduces null-related bugs in UI layer

---

**🖤 Made with dedication for the tattoo community**
