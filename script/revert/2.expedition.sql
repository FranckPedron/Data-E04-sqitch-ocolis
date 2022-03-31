-- Revert ocolis:2.expedition from pg

BEGIN;

DROP TABLE IF EXISTS delivery CASCADE;

COMMIT;
