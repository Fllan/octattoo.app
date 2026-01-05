# Day Eight: Data Model Expansion

**Date:** January 5, 2026
**Author:** FLLAN
**Branch:** `Foundations`

---

## Notes

**For tattoo artists:** Today was about building the foundation for how the app will track your work schedule and availability. We created a system that lets you mark which shops you work at (whether you're a permanent artist or a guest), set up your regular hours, and block out times when you're unavailable (like vacations or personal days). We also separated your personal information (name, pronouns) from your artist profile, which will eventually let you manage multiple artist personas if needed - useful if you work in different styles or at multiple locations under different names.

**For technophiles:** Implemented comprehensive data model refactoring including User/TattooArtist separation, workplace management, and a flexible availability system with recurring pattern support. Added soft delete capability to BaseClass via `deletedAt` field. Created architectural visualization of routing structure using Excalidraw. Models now support complex scheduling scenarios including permanent/guest artist statuses, recurring availabilities (daily/weekly/monthly/yearly patterns), and unavailability tracking. Reference: [Serverpod Models - Relations](https://docs.serverpod.dev/concepts/models#relations), [Serverpod Database - Indexes](https://docs.serverpod.dev/concepts/database/migrations#indexes).

---

## Summary

Expanded the data model architecture with User-TattooArtist separation, workplace management, and a comprehensive availability system supporting recurring patterns and soft deletes, while creating visual documentation of the routing structure to guide future navigation development.

---

## Added

### Documentation
- ✅ Published Day Seven journal entry ([`e5e663b`](https://github.com/Fllan/octattoo.app/commit/e5e663b))
  - Documented the iteration and revert process from Day Seven
  - Updated .gitignore to exclude CLAUDE.md

### Architecture Planning
- ✅ Created routing structure visualization ([`00c0ffc`](https://github.com/Fllan/octattoo.app/commit/00c0ffc))
  - Built Excalidraw diagram mapping navigation flow
  - Shows authentication gate, onboarding gate, and main app shell
  - Documents all primary routes (Projects, Appointments, ArtistProfile, More)
  - Visualizes decision points for user authentication and onboarding status

### Data Models

#### Core Infrastructure
- ✅ Renamed `OctattooBaseClass` to `BaseClass` ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Simpler, cleaner naming convention
  - Added `deletedAt` field for soft delete capability
  - Maintains UUID v7 primary keys
  - Maintains automatic `createdAt` and `updatedAt` timestamps

#### User Management
- ✅ Created `User` model separate from `TattooArtist` ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Fields: `firstName`, `lastName`, `pronoun`
  - Links to `AuthUser` (Serverpod authentication)
  - Includes `isOnboarded` flag for onboarding flow tracking
  - One-to-many relationship with `TattooArtist` (one user can have multiple artist profiles)
  - Unique index on `authUserId`

- ✅ Modified `TattooArtist` to reference `User` instead of `AuthUser` ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Changed from direct `AuthUser` relation to `User` relation
  - Enables future scenario: one person managing multiple artist personas
  - Maintains existing fields: `artistName`, `bio`, `pictureUrl`, `bannerUrl`
  - Added relations to `Availability` and `Unavailability`
  - Unique index on `artistName` (for public profile URLs)

#### Workplace Management
- ✅ Created `Workplace` model ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Fields: `name`, `address`
  - Links to `Address` model for location data
  - One-to-many relationship with `Availability`
  - Enables tracking where artists work (home studio, shops, conventions)

- ✅ Created `Address` model ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Shared model in `features/shared/` folder
  - Fields: `street`, `city`, `postalCode`, `country`, `note`
  - Reusable for workplaces, customers, and shipping addresses

#### Availability System
- ✅ Created `Availability` model ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Links `TattooArtist` to `Workplace` with time constraints
  - Fields: `startDate`, `endDate`, `startTime`, `endTime`, `isFullDay`
  - Supports `AvailabilityType` enum: permanent or guest
  - One-to-many relationship with `RecurringPattern`
  - Unique index prevents overlapping availabilities for same artist/workplace/dates

- ✅ Created `AvailabilityType` enum ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - `permanent`: Artist works regularly at this workplace
  - `guest`: Artist is visiting temporarily (guest spot)

- ✅ Created `RecurringPattern` model ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Describes how availabilities repeat over time
  - Fields: `recurringType`, `separationCount`, `dayOfWeek`, `weekOfMonth`, `dayOfMonth`, `monthOfYear`
  - Supports complex patterns like "every 2 weeks on Tuesday" or "last Friday of the month"

- ✅ Created `RecurringType` enum ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Values: `daily`, `weekly`, `monthly`, `yearly`
  - Combined with `separationCount` for flexible patterns (e.g., "every 3 days")

- ✅ Created `Unavailability` model ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Tracks when artists are not available (vacation, sick days, personal time)
  - Fields: `startDateTime`, `endDateTime`, `reason`
  - Links to `TattooArtist`
  - Overrides availability schedules

#### Code Organization
- ✅ Reorganized `ArtistNameTaken` exception into feature folder ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Moved from `exceptions/` to `features/tattoo_artist/exceptions/`
  - Better feature isolation and organization

#### Generated Code
- ✅ Ran `serverpod generate` to create all protocol code ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Generated client models for all new entities
  - Generated server models with database serialization
  - Updated endpoints registry
  - Updated test tools for new models

### Authentication
- ✅ Modified authentication screen to use registration flow ([`79d57b9`](https://github.com/Fllan/octattoo.app/commit/79d57b9))
  - Updated `SignInWidget` to use `EmailSignInWidget`
  - Set `startScreen` to `.startRegistration`
  - Directs new users to registration form by default

---

## Technical Implementation

### BaseClass Refinement

The `BaseClass` was renamed from `OctattooBaseClass` and enhanced with soft delete support:

**Serverpod YAML Definition (`base_class.spy.yaml`):**
```yaml
### Base class for all entities
class: BaseClass
fields:
    ### Unique identifier
    id: UuidValue?, defaultPersist=random_v7
    ### Timestamp of creation
    createdAt: DateTime, default=now
    ### Timestamp of last update
    updatedAt: DateTime, default=now
    ### Timestamp of deletion
    deletedAt: DateTime?
```

**Key Changes:**
- **Name simplification**: `OctattooBaseClass` → `BaseClass`
- **Soft deletes**: Added `deletedAt` field
  - `null` = record is active
  - Set to timestamp = record is soft-deleted
  - Allows "undo" operations and maintains referential integrity
  - Deleted records remain queryable for audit trails

**Soft Delete Pattern Benefits:**
1. No cascading deletions breaking relationships
2. Audit trail of what was deleted and when
3. Ability to restore deleted data
4. Compliance with data retention policies
5. Better debugging (can see historical state)

### User and TattooArtist Separation

Previously, `TattooArtist` linked directly to `AuthUser`. Now there's an intermediate `User` layer:

**Architecture Flow:**
```
AuthUser (Serverpod Auth)
    ↓ (1:1 relation)
User (personal identity)
    ↓ (1:many relation)
TattooArtist (professional persona)
```

**User Model (`user.spy.yaml`):**
```yaml
class: User
extends: BaseClass
table: user
fields:
    authUser: module:serverpod_auth_core:AuthUser?, relation(onDelete=Cascade)
    firstName: String, default=''
    lastName: String, default=''
    pronoun: String, default=''
    isOnboarded: bool, default=false
    tattooArtists: List<TattooArtist>?, relation(name=user_tattoo_artists)

indexes:
    auth_user_id_unique_idx:
        fields: authUserId
        unique: true
```

**Updated TattooArtist Model (`tattoo_artist.spy.yaml`):**
```yaml
class: TattooArtist
extends: BaseClass
table: tattoo_artist
fields:
    user: User?, relation(name=user_tattoo_artists)
    artistName: String, default=''
    bio: String, default=''
    pictureUrl: String, default=''
    bannerUrl: String, default=''
    availabilities: List<Availability>?, relation(name=artist_availabilities)
    unavailabilities: List<Unavailability>?, relation(name=artist_unavailabilities)

indexes:
    artistName_unique_idx:
        fields: artistName
        unique: true
```

**Why This Separation Matters:**

1. **Personal vs Professional Identity**
   - `User` = real person (first name, last name, pronouns)
   - `TattooArtist` = public persona (artist name, bio, portfolio)

2. **Multiple Personas Support**
   - One person can manage multiple artist profiles
   - Useful for different styles (traditional vs realism)
   - Useful for different locations or business entities
   - Useful for apprentices who become professionals

3. **Onboarding Flow**
   - `isOnboarded` flag tracks completion of setup wizard
   - Can create `User` without creating `TattooArtist` immediately
   - Allows progressive disclosure of features

4. **Data Isolation**
   - Personal data (name, pronouns) separate from public data
   - Privacy: can change artist name without changing personal identity
   - Security: artist name exposure doesn't expose personal name

### Workplace and Address Models

**Workplace Model (`workplace.spy.yaml`):**
```yaml
class: Workplace
extends: BaseClass
table: workplace
fields:
    name: String
    address: Address
    availabilities: List<Availability>?, relation(name=workplace_availabilities)
```

**Address Model (`shared/address.spy.yaml`):**
```yaml
class: Address
extends: BaseClass
table: address
fields:
    street: String
    city: String
    postalCode: String
    country: String
    note: String?
```

**Shared Model Pattern:**
- Located in `features/shared/` folder
- Reusable across multiple features
- Future use cases:
  - Customer addresses (for home visits or shipping flash)
  - Billing addresses for invoices
  - Convention locations
  - Shipping addresses for inventory orders

**Workplace Scenarios:**
1. **Home Studio**: Artist's private workspace
2. **Tattoo Shop**: Commercial shop where artist is employed or renting
3. **Guest Spot**: Temporary workspace at another artist's shop
4. **Convention**: Multi-day event at a specific venue
5. **Pop-up**: Temporary location (art gallery, festival booth)

### Availability System Architecture

The availability system models when and where artists work:

**Core Entity (`availability.spy.yaml`):**
```yaml
class: Availability
extends: BaseClass
table: availability
fields:
    tattooArtist: TattooArtist?, relation(name=artist_availabilities)
    workplace: Workplace?, relation(name=workplace_availabilities)
    startDate: DateTime
    endDate: DateTime?
    type: AvailabilityType
    startTime: DateTime
    endTime: DateTime?
    recurringPatterns: List<RecurringPattern>?, relation(name=availability_patterns)
    isFullDay: bool, default=false

indexes:
    availability_unique_idx:
        fields: tattooArtistId, workplaceId, startDate, endDate
        unique: true
```

**Data Model Relationships:**
```
TattooArtist ←→ Availability ←→ Workplace
                     ↓
              RecurringPattern
```

**Availability Types:**
- **Permanent**: Regular, ongoing work at this location
  - Example: "I work at Ink Paradise every Tuesday and Thursday"
  - Has `endDate = null` (open-ended)
  - Has recurring patterns

- **Guest**: Temporary visit to a workplace
  - Example: "I'm guest spotting at Berlin Tattoo June 15-20"
  - Has specific `startDate` and `endDate`
  - May have recurring patterns within that window

**Recurring Pattern Model (`recurring_pattern.spy.yaml`):**
```yaml
class: RecurringPattern
table: recurring_pattern
fields:
    availability: Availability?, relation(name=availability_patterns)
    recurringType: RecurringType
    separationCount: int?
    dayOfWeek: int?        # 1=Monday, 2=Tuesday, ...
    weekOfMonth: int?      # 1=first, -1=last
    dayOfMonth: int?       # 1=first, -1=last
    monthOfYear: int?      # 1=January, 2=February, ...
```

**Example Patterns:**

1. **Every Tuesday and Friday:**
   ```yaml
   recurringType: weekly
   separationCount: 1
   dayOfWeek: 2  # Tuesday
   ```
   ```yaml
   recurringType: weekly
   separationCount: 1
   dayOfWeek: 5  # Friday
   ```

2. **Every other Monday:**
   ```yaml
   recurringType: weekly
   separationCount: 2
   dayOfWeek: 1  # Monday
   ```

3. **First Saturday of every month:**
   ```yaml
   recurringType: monthly
   separationCount: 1
   dayOfWeek: 6       # Saturday
   weekOfMonth: 1     # First week
   ```

4. **Last Friday of the month:**
   ```yaml
   recurringType: monthly
   separationCount: 1
   dayOfWeek: 5       # Friday
   weekOfMonth: -1    # Last week
   ```

5. **Every 3 days:**
   ```yaml
   recurringType: daily
   separationCount: 3
   ```

**Unique Index Constraint:**
The composite index on `(tattooArtistId, workplaceId, startDate, endDate)` prevents:
- Double-booking an artist at the same workplace
- Conflicting availability records
- Data integrity issues in scheduling

**Unavailability Model (`unavailability.spy.yaml`):**
```yaml
class: Unavailability
extends: BaseClass
table: unavailability
fields:
    tattooArtist: TattooArtist?, relation(name=artist_unavailabilities)
    startDateTime: DateTime
    endDateTime: DateTime
    reason: String, default=''
```

**Unavailability vs Availability:**
- **Availability**: "When I CAN work"
- **Unavailability**: "When I CAN'T work" (overrides availability)

**Unavailability Use Cases:**
1. **Vacation**: "Off the grid July 1-14"
2. **Sick Leave**: "Out sick today"
3. **Personal Days**: "Doctor appointment 2-4pm"
4. **Holiday Closure**: "Shop closed Christmas week"
5. **Recovery Time**: "Hand needs rest after marathon session"

**Priority Logic (when implemented in business layer):**
1. Check `Unavailability` first (blocks scheduling)
2. If available, check `Availability` patterns
3. Calculate actual available time slots
4. Filter out booked appointments

### Routing Visualization

Created architectural diagram showing navigation flow:

**Decision Gates:**
```
User Lands on App
       ↓
Is Authenticated? ──No──> Authentication Route
       ↓ Yes
Is Onboarded? ──No──> Onboarding Route
       ↓ Yes
OctattooApp Shell (Bottom Navigation)
       ↓
┌──────┼──────┬──────┬──────┐
│      │      │      │      │
Projects  Appointments  Artist  More
                      Profile  (Settings, etc.)
```

**File Location:** `octattoo_journey/2026-01-05-Routing-design.excalidraw`

**Purpose:**
- Visual reference for navigation implementation
- Documents intended user flow
- Clarifies gate logic (authentication, onboarding)
- Shows relationship between routes and bottom navigation tabs

**Excalidraw Benefits:**
- Editable diagram (not static image)
- Version controlled (tracks changes)
- Can be opened in VS Code with Excalidraw extension
- Exports to PNG/SVG when needed for documentation

### Authentication Screen Update

Modified the authentication screen to default to registration:

**Before:**
```dart
SignInWidget(
  client: client,
  onAuthenticated: () {},
)
```

**After:**
```dart
SignInWidget(
  client: client,
  emailSignInWidget: EmailSignInWidget(
    client: client,
    startScreen: .startRegistration,
  ),
)
```

**Impact:**
- New users see registration form immediately
- Existing users can navigate to sign-in
- Optimized for onboarding flow (assumes most traffic is new users)
- Serverpod Auth handles form switching

---

## Architecture Decisions

**Separating User from TattooArtist**
- Enables one person to manage multiple professional identities
- Separates personal data (name, pronouns) from public data (artist name, bio)
- Supports future scenarios: apprentices, multi-style artists, business partnerships
- Trade-off: Additional database join when fetching artist data
- Benefit: Flexibility for complex real-world scenarios

**Adding soft delete to BaseClass**
- Prevents accidental permanent data loss
- Maintains referential integrity (no dangling foreign keys)
- Enables audit trails and compliance requirements
- Supports "undo" functionality in future UI
- Trade-off: Queries must filter `deletedAt IS NULL` to exclude deleted records
- Benefit: Data safety and recovery options

**Creating comprehensive availability system**
- Models real-world complexity of tattoo artist schedules
- Supports permanent staff and guest artists
- Handles recurring patterns without storing duplicate records
- Separates availability (can work) from unavailability (can't work)
- Trade-off: Complex data model requires sophisticated calendar logic
- Benefit: Accurate representation of artist scheduling needs

**Using recurring patterns instead of individual records**
- Avoids creating thousands of availability records for "every Tuesday"
- Stores pattern logic once, generates dates programmatically
- Reduces database storage and maintenance
- Easier to modify schedule ("change all Tuesdays" vs "update 52 records")
- Trade-off: Must compute actual dates from patterns at query time
- Benefit: Efficient storage and flexible schedule management

**Modeling Workplace as separate entity**
- Artists work at multiple locations (home studio, shops, conventions)
- Workplaces have physical addresses
- Availabilities link artist to workplace with time constraints
- Enables multi-location booking calendar
- Trade-off: More complex data relationships
- Benefit: Accurate representation of multi-location work scenarios

**Using Address as shared model**
- Addresses needed for workplaces, customers, shipping, billing
- Avoids duplicating address fields across multiple models
- Establishes pattern for shared infrastructure models
- Located in `features/shared/` to signal reusability
- Trade-off: Less direct field access (must join through address table)
- Benefit: Consistency and DRY principle adherence

**Unique index on availability composite key**
- Prevents double-booking artist at same workplace for overlapping dates
- Database-level constraint ensures data integrity
- Catches race conditions that application logic might miss
- Trade-off: Requires careful handling of date range updates
- Benefit: Guaranteed consistency in scheduling data

**Renaming OctattooBaseClass to BaseClass**
- Simpler, cleaner naming (less redundant prefix)
- Follows common naming patterns in other frameworks
- Easier to read and discuss in conversation
- Trade-off: Less explicit about project context
- Benefit: Better readability and standard convention

**Defaulting authentication to registration screen**
- Optimized for onboarding new users
- Assumes primary traffic is new signups (early stage app)
- Existing users can easily navigate to sign-in
- Reduces friction for primary user flow
- Trade-off: Returning users need one extra click
- Benefit: Optimized funnel for user acquisition

**Creating routing diagram before implementation**
- Visual planning prevents rework during implementation
- Documents intended flow for team review (solo dev, but useful for AI assistants)
- Identifies missing states or edge cases early
- Serves as specification for navigation code
- Trade-off: Time spent on planning instead of coding
- Benefit: Clearer vision and reduced debugging later

---

**🖤 Made with dedication for the tattoo community**
