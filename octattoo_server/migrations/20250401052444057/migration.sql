BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "tattoo_artist" ALTER COLUMN "bio" SET NOT NULL;

--
-- MIGRATION VERSION FOR octattoo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('octattoo', '20250401052444057', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250401052444057', "timestamp" = now();

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
