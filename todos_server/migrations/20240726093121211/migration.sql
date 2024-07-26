BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "todo" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "content" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR todos
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todos', '20240726093121211', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240726093121211', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
