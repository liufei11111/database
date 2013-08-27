col type            format a10
col constraint_name format a30

select   
   decode(constraint_type,
     'C', 'Check',
     'O', 'R/O View',
     'P', 'Primary',
     'R', 'Foreign',
     'U', 'Unique',
     'V', 'Check view') type,
   constraint_name,
   status,
   last_change,
from    
see BC Oracle code depot for alternate scripts.
   dba_constraints
where
   table_name = 'MYTAB'
order by 
   1;
