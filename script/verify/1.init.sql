-- Verify ocolis:1.init on pg

BEGIN;

SELECT id,reference,name,address,additional,postal_code,city FROM place;

SELECT id,serial_number,content_description,weight,height,width,depth,worth,sender_id,recipient_id,request_time,expedition_time,delivered_time FROM package;


ROLLBACK;
