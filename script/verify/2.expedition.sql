-- Verify ocolis:2.expedition on pg

BEGIN;

SELECT id, driver_name, vehicle_plate, starting_time, ending_time FROM delivery;


ROLLBACK;
