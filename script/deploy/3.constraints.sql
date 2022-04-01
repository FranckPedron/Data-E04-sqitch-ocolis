-- Deploy ocolis:3.constraints to pg

BEGIN;

-- j'ajoute la contrainte qui vient vérifier si request_time est inférieur à delivery_time
-- la fonction CHECK vient vérifier une condition
-- si c'est à true, il laisse l'insertion/la mise à jour se faire sinon il retourne une erreur
ALTER TABLE package
    ADD CONSTRAINT package_request_time_delivery_time CHECK(request_time < delivered_time);

-- je viens créer un DOMAIN qui me permet de venir customiser un type natif
-- ici je fais en sorte que je n'ai que des entiers positifs
CREATE DOMAIN pint AS integer CHECK (VALUE > 0);
CREATE DOMAIN postal_code_fr AS integer CHECK (VALUE ~ '(^([0-8]\d)|(9([0-5]|[7-8])))\d{3}$');

CREATE DOMAIN license_plate_fr AS text CHECK (
    VALUE ~ '^[a-zA-Z]{2}(\d{3}|[\-|\s]\d{3})(([a-zA-Z]{2})|[\-|\s][a-zA-Z]{2})')
        AND 
    VALUE ~ '![IOU]';

ALTER TABLE package
    ALTER COLUMN width TYPE pint,
    ALTER COLUMN height TYPE pint,
    ALTER COLUMN depth TYPE pint;

COMMIT;
