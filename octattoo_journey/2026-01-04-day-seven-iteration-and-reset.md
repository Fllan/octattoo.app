# Day Seven: Iteration and Reset

**Date:** January 4, 2026
**Author:** FLLAN
**Branch:** `Foundations`

---

## Notes

**For tattoo artists:** Today was about trying different ways to build the system that stores your artist profile. We tried adding features like automatic ID generation, profile picture uploads, and unique artist names. After building all of this, we realized the approach was getting too complicated too quickly, so we made the smart decision to step back and start fresh from a simpler, working version. This kind of step-back-and-rethink moment happens often in development and helps keep the project on track.

**For technophiles:** Implemented UUID v7-based base class pattern for timestamp-ordered primary keys, added artist profile creation hooks, built file upload infrastructure with Serverpod's direct upload API, created custom exception types, and attempted to centralize asset management. After four progressive commits, recognized architectural overreach and performed a strategic revert to the pre-MVVM stable state. This preserves the MVVM research documentation while avoiding premature optimization. Reference: [Serverpod Models - Extending Classes](https://docs.serverpod.dev/concepts/models#extending-a-class), [Serverpod File Uploads](https://docs.serverpod.dev/concepts/file-uploads).

---

## Summary

Experimented with foundational data model patterns including UUID v7 primary keys, automatic artist profile creation, file upload infrastructure, and centralized asset management, ultimately recognizing architectural complexity was premature and strategically reverting to maintain project stability and focus.

---

## Added (Then Reverted)

### Base Model Pattern
- ✅ Created `OctattooBaseClass` for all domain models ([`6b672f1`](https://github.com/Fllan/octattoo.app/commit/6b672f1), reverted in [`788fd41`](https://github.com/Fllan/octattoo.app/commit/788fd41))
  - UUID v7 primary keys with `defaultPersist=random_v7`
  - Automatic `createdAt` timestamp (default=now)
  - Automatic `updatedAt` timestamp (default=now)
  - Time-ordered, indexable identifiers
  - Removed MVVM.md documentation (2,481 lines deleted)
  - Created new database migration (20260104083040159)
  - Modified TattooArtist to extend BaseClass

### Artist Profile Integration
- ✅ Enabled automatic TattooArtist creation on user registration ([`bc1bf64`](https://github.com/Fllan/octattoo.app/commit/bc1bf64), reverted in [`788fd41`](https://github.com/Fllan/octattoo.app/commit/788fd41))
  - Uncommented `onAfterUserProfileCreated` hook in server initialization
  - TattooArtist profile created automatically when user registers
  - Added unique index on `artistName` field
  - Added CLAUDE.md to .gitignore

### File Upload Infrastructure
- ✅ Implemented image upload endpoints for TattooArtist ([`f3c331e`](https://github.com/Fllan/octattoo.app/commit/f3c331e), reverted in [`788fd41`](https://github.com/Fllan/octattoo.app/commit/788fd41))
  - Direct file upload API for profile pictures
  - Direct file upload API for banner images
  - Upload description generation
  - Upload verification methods
  - Public URL retrieval for uploaded images
  - Added `file_picker` dependency to Flutter app (pubspec.yaml)

### Asset Management & Refactoring (Dead End)
- ✅ Created centralized AssetEndpoint ([`28d633a`](https://github.com/Fllan/octattoo.app/commit/28d633a), reverted in [`788fd41`](https://github.com/Fllan/octattoo.app/commit/788fd41))
  - Generic upload/verify/delete methods for any asset path
  - `buildAssetPath` utility for standardized paths
  - Refactored TattooArtistEndpoint to use AssetEndpoint patterns
  - Created custom `ArtistNameTaken` exception type
  - Modified server initialization to handle storage configuration
  - Recognized this was "too much to refactor" (commit message)

### Strategic Reversion
- ✅ Reverted all 6 commits to return to stable foundation ([`788fd41`](https://github.com/Fllan/octattoo.app/commit/788fd41))
  - Restored MVVM.md documentation (2,481 lines)
  - Removed BaseClass pattern and UUID v7 implementation
  - Removed TattooArtist auto-creation hook
  - Removed file upload infrastructure
  - Removed AssetEndpoint and custom exceptions
  - Restored earlier database migration (20251225180313604)
  - Returned to commit 55db05f state

---

## Technical Implementation

### UUID v7 Base Class Pattern

The BaseClass implementation provided automatic fields for all domain models:

**Serverpod YAML Definition (`octattoo_base_class.spy.yaml`):**
```yaml
class: OctattooBaseClass
fields:
    id: UuidValue?, defaultPersist=random_v7
    createdAt: DateTime, default=now
    updatedAt: DateTime, default=now
```

**Key Features:**
- **UUID v7**: Time-ordered UUIDs that can be sorted chronologically
- **defaultPersist=random_v7**: Automatic ID generation on database insert
- **default=now**: Automatic timestamp management
- **No table**: Base class doesn't create its own table, only extends to concrete models

**TattooArtist Extension:**
```yaml
class: TattooArtist
extends: OctattooBaseClass
table: tattoo_artist
fields:
    authUser: module:serverpod_auth_core:AuthUser?, relation(onDelete=Cascade)
    artistName: String, default=''
    bio: String, default=''
    pictureUrl: String, default=''
    bannerUrl: String, default=''
```

This eliminated the need for explicit `id`, `createdAt`, and `updatedAt` fields in each model.

**Generated Code Impact:**
- Client model: Added UUID v7 support and timestamp fields
- Server model: Included database serialization for UUIDs
- Migration: Modified primary key type from `bigserial` to `uuid`

### Automatic Artist Profile Creation

The server initialization was modified to create TattooArtist profiles automatically:

**Server Hook (`octattoo_server/lib/server.dart`):**
```dart
serverpodAuth.init(
  baseEndpoint: baseEndpoint,
  authUserConfiguration: authUserConfiguration,
  userImageGenerator: defaultUserImageGenerator,
  onAfterUserProfileCreated: (session, userProfile, {required transaction}) async {
    final newTattooArtist = TattooArtist(
      authUserId: userProfile.authUserId,
    );
    await TattooArtist.db.insertRow(
      session,
      newTattooArtist,
      transaction: transaction,
    );
  },
);
```

**How It Works:**
1. User completes email/password registration
2. Serverpod Auth creates `AuthUser` and `UserProfile`
3. `onAfterUserProfileCreated` hook fires within same transaction
4. TattooArtist record created with reference to `authUserId`
5. If any step fails, transaction rolls back (atomic operation)

**Unique Constraints Added:**
```yaml
indexes:
  auth_user_id_unique_idx:
    fields: authUserId
    unique: true
  artistName_unique_idx:
    fields: artistName
    unique: true
```

This enforced one-to-one relationship between users and artists, plus unique artist names across the platform.

### File Upload Infrastructure

Implemented Serverpod's direct file upload pattern for artist images:

**TattooArtistEndpoint Methods:**
```dart
/// Gets a direct file upload description for a profile picture.
Future<String?> getProfilePictureUploadDescription(Session session) async {
  return _getImageUploadDescription(session, 'profile-picture.jpg');
}

/// Verifies a profile picture upload.
Future<bool> verifyProfilePictureUpload(Session session) async {
  return _verifyImageUpload(session, 'profile-picture.jpg');
}

/// Gets the profile picture URL.
Future<Uri?> getProfilePictureUrl(Session session) async {
  return _getImageUrl(session, 'profile-picture.jpg');
}
```

**Internal Helper Pattern:**
```dart
Future<String?> _getImageUploadDescription(Session session, String filename) async {
  var authUserId = await _getAuthenticatedUserId(session);
  return await session.storage.createDirectFileUploadDescription(
    storageId: 'public',
    path: 'tattoo-artist/$authUserId/$filename',
  );
}

Future<bool> _verifyImageUpload(Session session, String filename) async {
  var authUserId = await _getAuthenticatedUserId(session);
  return await session.storage.verifyDirectFileUpload(
    storageId: 'public',
    path: 'tattoo-artist/$authUserId/$filename',
  );
}
```

**Upload Flow:**
1. Client calls `getProfilePictureUploadDescription()`
2. Server returns signed upload URL with expiration
3. Client uploads directly to storage (S3, GCS, or local)
4. Client calls `verifyProfilePictureUpload()` to confirm
5. Server verifies file exists at expected path
6. Client calls `getProfilePictureUrl()` to get public URL

**Benefits:**
- No file data passes through server (reduces bandwidth)
- Signed URLs provide temporary, scoped access
- Client uploads directly to storage backend
- Server only handles authorization and verification

**Dependency Added:**
```yaml
# octattoo_flutter/pubspec.yaml
dependencies:
  file_picker: ^8.1.4
```

### Centralized Asset Management (AssetEndpoint)

The "dead end" commit attempted to abstract asset operations:

**AssetEndpoint Design:**
```dart
class AssetEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<Uri?> getAssetUrl(Session session, String path) async {
    final exists = await session.storage.fileExists(
      storageId: 'public',
      path: path,
    );
    if (!exists) return null;
    return await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> deleteAsset(Session session, String path) async {
    await session.storage.deleteFile(
      storageId: 'public',
      path: path,
    );
    return !await session.storage.fileExists(
      storageId: 'public',
      path: path,
    );
  }

  String buildAssetPath(String feature, UuidValue userId, String filename) {
    return '$feature/$userId/$filename';
  }
}
```

**Refactored TattooArtistEndpoint Pattern:**
```dart
Future<String?> getProfilePictureUploadDescription(Session session) async {
  var authUserId = await _getAuthenticatedUserId(session);
  var path = AssetEndpoint.buildAssetPath(
    'tattoo-artist',
    authUserId,
    'profile-picture.jpg',
  );
  return AssetEndpoint.getUploadDescription(session, path);
}
```

**Custom Exception Type:**
```yaml
# artist_name_taken.spy.yaml
exception: ArtistNameTaken
fields:
  message: String
```

This generated a proper Serverpod exception that could be caught client-side.

### Why This Was a "Dead End"

**Architectural Overreach:**
1. **Too much abstraction too early**: AssetEndpoint creates a generic layer before understanding specific needs
2. **Premature optimization**: Abstracting patterns we've only used once
3. **Increased complexity**: More indirection makes debugging harder
4. **Unclear ownership**: Who manages asset paths? Endpoint? Caller? Service?
5. **BaseClass changes**: Switching from integer to UUID primary keys affects all existing code

**Scope Creep Indicators:**
- Started with "add base class" → ended with centralized asset management
- Each commit added new architectural layer
- No actual feature delivery, only infrastructure
- MVVM.md deleted (removing valuable documentation)
- Would require refactoring ALL future models to use BaseClass

**Commit Message Recognition:**
```
feat: :construction: dead end... Too much to refactor
```

The developer recognized mid-implementation that the direction required too much refactoring for uncertain benefit.

---

## Architecture Decisions

**Attempting UUID v7 primary keys**
- UUID v7 provides time-ordered, globally unique identifiers
- Eliminates autoincrement integer race conditions in distributed systems
- Allows client-side ID generation for offline-first patterns
- More storage overhead than integers (16 bytes vs 8 bytes)
- Better for multi-region deployments and data migration
- Trade-off: Increased complexity for a single-server application at this stage

**Creating a base class pattern for all models**
- Provides consistent fields (id, createdAt, updatedAt) across all tables
- Reduces boilerplate in model definitions
- Establishes convention for future models
- Risk: Forces all models to follow same pattern even if not needed
- Trade-off: Consistency vs flexibility

**Enabling automatic artist profile creation**
- Simplifies user registration flow (one step instead of two)
- Ensures every authenticated user has an artist profile
- Maintains referential integrity with transaction
- Assumes all users are artists (true for this app's audience)
- Alternative would be separate "create artist profile" step

**Building file upload infrastructure early**
- Profile pictures and banners are core to artist identity
- Direct upload pattern reduces server load
- Establishes pattern for future file uploads (tattoo designs, consent forms)
- Trade-off: Added complexity before profile editing UI exists
- Premature: No UI to use this functionality yet

**Attempting to centralize asset management**
- AssetEndpoint creates reusable asset operations
- Standardizes path building and storage access
- Could serve multiple features (artists, projects, inventory)
- Problem: Abstracts patterns we've only used in one place
- Problem: Unclear separation of concerns between endpoints

**Adding unique artist name constraint**
- Prevents duplicate artist names on platform
- Provides better user experience (clear artist identity)
- Creates namespace scarcity (first-come, first-served)
- Alternative: Allow duplicates, use UUID for routing
- Trade-off: Simplicity vs uniqueness guarantees

**Choosing to revert rather than refactor forward**
- Recognized increasing complexity without delivered features
- Preserved working state over speculative improvements
- Avoided sunk cost fallacy ("already invested time, must continue")
- Maintained project velocity by not blocking on infrastructure
- Kept MVVM.md documentation (retained learning)
- Demonstrated pragmatic decision-making: code is cheap, wrong direction is expensive

**Restoring MVVM.md documentation**
- 2,481 lines of architectural research is valuable asset
- Documents investigation effort and findings
- Provides reference for future architectural decisions
- Serves as onboarding material for patterns and rationale
- Acknowledges that research has value even if implementation is deferred

**Returning to commit 55db05f state**
- Represents last stable, understood architecture
- Before UUID v7, BaseClass, and asset management experiments
- Includes TattooArtist model with simple integer primary key
- Simpler starting point for incremental feature development
- Enables focus on delivering user-facing functionality over infrastructure

---

**🖤 Made with dedication for the tattoo community**
