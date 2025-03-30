BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "address" (
    "id" bigserial PRIMARY KEY,
    "street" text NOT NULL,
    "city" text NOT NULL,
    "postalCode" text NOT NULL,
    "country" text NOT NULL,
    "note" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "appointment" (
    "id" bigserial PRIMARY KEY,
    "tattooArtistId" bigint NOT NULL,
    "workplaceId" bigint NOT NULL,
    "tattooProjectId" bigint,
    "start" timestamp without time zone NOT NULL,
    "end" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "availability" (
    "id" bigserial PRIMARY KEY,
    "createdById" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "workplaceId" bigint,
    "startDate" timestamp without time zone NOT NULL,
    "endDate" timestamp without time zone,
    "startTime" timestamp without time zone NOT NULL,
    "endTime" timestamp without time zone,
    "isFullDay" boolean NOT NULL,
    "isRecurring" boolean NOT NULL,
    "type" text NOT NULL,
    "title" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "company" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "name" text NOT NULL,
    "vat" bigint,
    "officialId" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "customer" (
    "id" bigserial PRIMARY KEY,
    "tattooArtistId" bigint NOT NULL,
    "email" text,
    "phone" text,
    "addressId" bigint,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text,
    "tags" json
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "customer_tag" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "ownerId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "flash" (
    "id" bigserial PRIMARY KEY,
    "createdById" bigint NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "albumId" bigint NOT NULL,
    "isAvailable" boolean NOT NULL,
    "suggestedPosition" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "estimatedPrice" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "invoice" (
    "id" bigserial PRIMARY KEY,
    "customerId" bigint NOT NULL,
    "tattooArtistId" bigint NOT NULL,
    "workplaceId" bigint,
    "tattooProjectId" bigint,
    "quotationId" bigint,
    "price" bigint NOT NULL,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "picture" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "path" text NOT NULL,
    "_pictureAlbumPicturesPictureAlbumId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "picture_album" (
    "id" bigserial PRIMARY KEY,
    "createdById" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quotation" (
    "id" bigserial PRIMARY KEY,
    "customerId" bigint NOT NULL,
    "tattooArtistId" bigint NOT NULL,
    "workplaceId" bigint,
    "tattooProjectId" bigint,
    "price" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "duration" bigint NOT NULL,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "recurring_pattern" (
    "id" bigserial PRIMARY KEY,
    "availabilityId" bigint NOT NULL,
    "recurringType" text NOT NULL,
    "separationCount" bigint,
    "dayOfWeek" bigint,
    "weekOfMonth" bigint,
    "dayOfMonth" bigint,
    "monthOfYear" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tattoo_artist" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "companyId" bigint,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "bio" text,
    "artistName" text NOT NULL,
    "showRealNames" boolean NOT NULL,
    "showPronoun" boolean NOT NULL,
    "_workplaceManagedbyWorkplaceId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tattoo_project" (
    "id" bigserial PRIMARY KEY,
    "tattooArtistId" bigint NOT NULL,
    "customerId" bigint NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "albumId" bigint NOT NULL,
    "position" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "firstName" text,
    "lastName" text,
    "pronoun" text,
    "userInfoId" bigint NOT NULL,
    "addressId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user" USING btree ("userInfoId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "workplace" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "addressId" bigint NOT NULL,
    "isPublic" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "appointment"
    ADD CONSTRAINT "appointment_fk_0"
    FOREIGN KEY("tattooArtistId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "appointment"
    ADD CONSTRAINT "appointment_fk_1"
    FOREIGN KEY("workplaceId")
    REFERENCES "workplace"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "appointment"
    ADD CONSTRAINT "appointment_fk_2"
    FOREIGN KEY("tattooProjectId")
    REFERENCES "tattoo_project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "availability"
    ADD CONSTRAINT "availability_fk_0"
    FOREIGN KEY("createdById")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "availability"
    ADD CONSTRAINT "availability_fk_1"
    FOREIGN KEY("workplaceId")
    REFERENCES "workplace"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "company"
    ADD CONSTRAINT "company_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "customer"
    ADD CONSTRAINT "customer_fk_0"
    FOREIGN KEY("tattooArtistId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "customer"
    ADD CONSTRAINT "customer_fk_1"
    FOREIGN KEY("addressId")
    REFERENCES "address"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "customer_tag"
    ADD CONSTRAINT "customer_tag_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "flash"
    ADD CONSTRAINT "flash_fk_0"
    FOREIGN KEY("createdById")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "flash"
    ADD CONSTRAINT "flash_fk_1"
    FOREIGN KEY("albumId")
    REFERENCES "picture_album"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "invoice"
    ADD CONSTRAINT "invoice_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "customer"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "invoice"
    ADD CONSTRAINT "invoice_fk_1"
    FOREIGN KEY("tattooArtistId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "invoice"
    ADD CONSTRAINT "invoice_fk_2"
    FOREIGN KEY("workplaceId")
    REFERENCES "workplace"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "invoice"
    ADD CONSTRAINT "invoice_fk_3"
    FOREIGN KEY("tattooProjectId")
    REFERENCES "tattoo_project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "invoice"
    ADD CONSTRAINT "invoice_fk_4"
    FOREIGN KEY("quotationId")
    REFERENCES "quotation"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "picture"
    ADD CONSTRAINT "picture_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "picture"
    ADD CONSTRAINT "picture_fk_1"
    FOREIGN KEY("_pictureAlbumPicturesPictureAlbumId")
    REFERENCES "picture_album"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "picture_album"
    ADD CONSTRAINT "picture_album_fk_0"
    FOREIGN KEY("createdById")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "quotation"
    ADD CONSTRAINT "quotation_fk_0"
    FOREIGN KEY("customerId")
    REFERENCES "customer"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "quotation"
    ADD CONSTRAINT "quotation_fk_1"
    FOREIGN KEY("tattooArtistId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "quotation"
    ADD CONSTRAINT "quotation_fk_2"
    FOREIGN KEY("workplaceId")
    REFERENCES "workplace"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "quotation"
    ADD CONSTRAINT "quotation_fk_3"
    FOREIGN KEY("tattooProjectId")
    REFERENCES "tattoo_project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "recurring_pattern"
    ADD CONSTRAINT "recurring_pattern_fk_0"
    FOREIGN KEY("availabilityId")
    REFERENCES "availability"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tattoo_artist"
    ADD CONSTRAINT "tattoo_artist_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "tattoo_artist"
    ADD CONSTRAINT "tattoo_artist_fk_1"
    FOREIGN KEY("companyId")
    REFERENCES "company"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "tattoo_artist"
    ADD CONSTRAINT "tattoo_artist_fk_2"
    FOREIGN KEY("_workplaceManagedbyWorkplaceId")
    REFERENCES "workplace"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tattoo_project"
    ADD CONSTRAINT "tattoo_project_fk_0"
    FOREIGN KEY("tattooArtistId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "tattoo_project"
    ADD CONSTRAINT "tattoo_project_fk_1"
    FOREIGN KEY("customerId")
    REFERENCES "customer"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "tattoo_project"
    ADD CONSTRAINT "tattoo_project_fk_2"
    FOREIGN KEY("albumId")
    REFERENCES "picture_album"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_1"
    FOREIGN KEY("addressId")
    REFERENCES "address"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "workplace"
    ADD CONSTRAINT "workplace_fk_0"
    FOREIGN KEY("addressId")
    REFERENCES "address"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR octattoo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('octattoo', '20250330160930110', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250330160930110', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
