 
-- Drop_Tables.sql - Creates script to drop all tables and views from schema
--  Use: script reads table list from schema and spools to a new script
--       containing statements used to drop each table and view.
--       That script is called and drops the schema tables and views on the list.
--
Spool drop_schema_tables.sql
 
select 'Drop ' || object_type || ' ' || object_name || ';' from user_objects
where object_type in ('TABLE','VIEW')
ORDER BY object_type DESC, object_name;
spool off
 
-- @drop_schema_tables.sql
