CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC
AS $$
DECLARE
    min_value NUMERIC;
    i INTEGER;
BEGIN
    IF arr IS NULL OR array_length(arr, 1) = 0 THEN
        RAISE EXCEPTION 'Array must not be empty';
    END IF;

    min_value := arr[1];

    FOR i IN 2 .. array_length(arr, 1)
    LOOP
        IF arr[i] < min_value THEN
            min_value := arr[i];
        END IF;
    END LOOP;

    RETURN min_value;
END;
$$ LANGUAGE plpgsql;