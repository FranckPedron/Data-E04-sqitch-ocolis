INSERT INTO public.place(
	reference, name, address, additional, postal_code, city)
	VALUES
	('atome_1', 'Norris', 'everywhere', 'dont look after him', 00000, 'Toulouse'),
	('atome_2', 'JCVD', 'aware', null, 54321, 'Bruxelles');


INSERT INTO public."package"(
	serial_number, content_description, weight, height,width,depth, worth, sender_id, recipient_id,expedition_time)
	VALUES (1, 'vent', 0.0, 100,1,1, 10000000, 1, 2,'2022-03-31'),
	(2, 'air', 0.0, 100,1,1, 10000000, 2, 1,'2022-03-31');