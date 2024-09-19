-- step 1 trigger function
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (row_id, name, age, gender, address, type_event, created)
    VALUES (OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address, 'D', now());

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- step 2 trigger itself
CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();