INSERT INTO insurance_obj_table values(  insurance_typ ('i0031', 'dental', 'DentalCare', 5780, '50031', 
(select REF(e) from insurance_obj_table e where e.iid='i0003')));
