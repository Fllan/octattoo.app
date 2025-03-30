BEGIN;

--
-- Class Address as table address
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
-- Class Appointment as table appointment
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
-- Class Availability as table availability
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
-- Class Company as table company
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
-- Class Customer as table customer
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
-- Class CustomerTag as table customer_tag
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
-- Class Flash as table flash
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
-- Class Invoice as table invoice
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
-- Class Picture as table picture
--
CREATE TABLE "picture" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "path" text NOT NULL,
    "_pictureAlbumPicturesPictureAlbumId" bigint
);

--
-- Class PictureAlbum as table picture_album
--
CREATE TABLE "picture_album" (
    "id" bigserial PRIMARY KEY,
    "createdById" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- Class Quotation as table quotation
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
-- Class RecurringPattern as table recurring_pattern
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
-- Class TattooArtist as table tattoo_artist
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
-- Class TattooProject as table tattoo_project
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
-- Class User as table user
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
-- Class Workplace as table workplace
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
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Class AuthKey as table serverpod_auth_key
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- Class EmailAuth as table serverpod_email_auth
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- Class EmailCreateAccountRequest as table serverpod_email_create_request
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- Class EmailFailedSignIn as table serverpod_email_failed_sign_in
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- Class EmailReset as table serverpod_email_reset
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- Class GoogleRefreshToken as table serverpod_google_refresh_token
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- Class UserImage as table serverpod_user_image
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- Class UserInfo as table serverpod_user_info
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");

--
-- Foreign relations for "appointment" table
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
-- Foreign relations for "availability" table
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
-- Foreign relations for "company" table
--
ALTER TABLE ONLY "company"
    ADD CONSTRAINT "company_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "customer" table
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
-- Foreign relations for "customer_tag" table
--
ALTER TABLE ONLY "customer_tag"
    ADD CONSTRAINT "customer_tag_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "tattoo_artist"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "flash" table
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
-- Foreign relations for "invoice" table
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
-- Foreign relations for "picture" table
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
-- Foreign relations for "picture_album" table
--
ALTER TABLE ONLY "picture_album"
    ADD CONSTRAINT "picture_album_fk_0"
    FOREIGN KEY("createdById")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "quotation" table
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
-- Foreign relations for "recurring_pattern" table
--
ALTER TABLE ONLY "recurring_pattern"
    ADD CONSTRAINT "recurring_pattern_fk_0"
    FOREIGN KEY("availabilityId")
    REFERENCES "availability"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "tattoo_artist" table
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
-- Foreign relations for "tattoo_project" table
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
-- Foreign relations for "user" table
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
-- Foreign relations for "workplace" table
--
ALTER TABLE ONLY "workplace"
    ADD CONSTRAINT "workplace_fk_0"
    FOREIGN KEY("addressId")
    REFERENCES "address"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
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
