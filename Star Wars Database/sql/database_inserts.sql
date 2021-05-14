# SQL inserts necessary to recreate our database.
# Or appropriate CSV files and an import script.
START TRANSACTION;
INSERT INTO LGBRAND VALUES (23, 'FORESTERS BEST', 'VALUE');
INSERT INTO LGBRAND VALUES (33, 'BINDER PRIME', 'PREMIUM');
COMMIT;
