-- Deploy ocolis:1.init to pg

BEGIN;

CREATE TABLE place (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    reference text NOT NULL UNIQUE,
    name text NOT NULL,
    address text NOT NULL,
    additional text,
    postal_code int NOT NULL,
    city text NOT NULL
);

CREATE TABLE package (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    serial_number TEXT UNIQUE NOT NULL,
    content_description text NOT NULL,
    weight float NOT NULL, -- en kg, avec précision au gramme près
    --volume int NOT NULL, -- en centimètres cubes
    height int NOT NULL,
    depth int NOT NULL,
    width int NOT NULL,
    worth int NOT NULL, -- c'est approximatif à l'euro près
    sender_id int REFERENCES place(id),
    recipient_id int REFERENCES place(id),
    request_time TIMESTAMPTZ NOT NULL DEFAULT now(),
    expedition_time TIMESTAMPTZ,
    delivered_time TIMESTAMPTZ
);

COMMIT;
