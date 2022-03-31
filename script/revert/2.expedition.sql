-- Revert ocolis:2.expedition from pg

BEGIN;

-- j'ajoute la colonne expedition_time de package 
ALTER TABLE package
    ADD COLUMN expedition_time TIMESTAMPTZ;
-- je viens mettre à jour la colonne expedition_time
UPDATE package SET expedition_time = (
    SELECT starting_time FROM delivery WHERE delivery.id=package.delivery_id
);
-- suppression de la clef étrangère dans package
ALTER TABLE package
    DROP COLUMN delivery_id;
-- suppression de la table delivery pour les expéditions
DROP TABLE delivery;

COMMIT;
