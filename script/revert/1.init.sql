-- Revert ocolis:1.init from pg

BEGIN;

DROP TABLE IF EXISTS place,package CASCADE;
COMMIT;
