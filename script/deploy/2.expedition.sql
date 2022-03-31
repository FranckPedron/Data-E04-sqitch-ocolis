-- Deploy ocolis:2.expedition to pg

BEGIN;

CREATE TABLE delivery (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    driver_name TEXT NOT NULL,
    vehicle_plate TEXT NOT NULL,
    starting_time TIMESTAMPTZ NOT NULL default now(),
    ending_time TIMESTAMPTZ
);

ALTER TABLE package ADD COLUMN delivery_id int REFERENCES delivery(id);

-- on vient ajouter des expéditions par rapport aux enregistrements de package déjà présents
-- tous les packages (colis) expédiés le même jour ne concernent qu'une livraison (delivery)
INSERT INTO delivery (driver_name,vehicle_plate,starting_time)
    SELECT DISTINCT 'inconnu','inconnu',expedition_time FROM package WHERE expedition_time is NOT NULL;

-- on met à jour le delivery_id dans package
UPDATE package SET delivery_id = (
    -- je récupère les id des deliveries en comparant le starting_time et l'expedition_time
    SELECT id FROM delivery WHERE starting_time=package.expedition_time
);


-- je supprime la colonne expedition_time de package qui est maintenant inutile (on se sert de starting_time dans delivery)
ALTER TABLE package DROP COLUMN expedition_time;

COMMIT;
