CREATE TABLE public.qdu_dbd_test_results (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"year" int4 NOT NULL,
	year_has_acts bool DEFAULT false NOT NULL,
	tags_assignment_complete bool DEFAULT false NOT NULL,
	CONSTRAINT qdu_dbd_test_pk PRIMARY KEY (id),
	CONSTRAINT qdu_dbd_test_unique UNIQUE (year)
);

create or replace function qdu_dbd_test_results_trigger_acts_fn()
returns trigger as $$ begin
	insert into qdu_dbd_test_results ("year", year_has_acts)
	values (NEW."year", true) on conflict ("year") do nothing;
	RETURN NEW;
end; $$ language plpgsql

create or replace function qdu_dbd_test_results_trigger_acts_tags_fn()
returns trigger as $$ declare
    ta_incomplete qdu_dbd_test_results.year_has_acts%TYPE;
    a_year acts."year"%TYPE;
begin
--	insert into qdu_dbd_test_results ("year", year_has_acts, tags_assignment_complete)
--	values (NEW."year", true) on conflict ("year") do nothing;
    select acts."year" into a_year from acts where acts.act_id = NEW.act_id;
	select exists(
		SELECT a.act_id, a.du_code,
        COUNT(at.act_id) AS tag_count
		FROM acts a
		LEFT JOIN acts_tags at ON a.act_id = at.act_id
		where a."year" = a_year
		GROUP BY a.act_id
		HAVING COUNT(at.act_id) != 5
	) into ta_incomplete;
	IF ta_incomplete THEN
        insert into qdu_dbd_test_results ("year", year_has_acts, tags_assignment_complete)
		values (a_year, true, false) 
		on conflict ("year") do update set tags_assignment_complete = false;
	ELSE
		insert into qdu_dbd_test_results ("year", year_has_acts, tags_assignment_complete)
		values (a_year, true, true) 
		on conflict ("year") do update set tags_assignment_complete = true;
	END IF;
	RETURN NEW;
end; $$ language plpgsql

create or replace trigger qdu_dbd_test_results_trigger_acts
after insert on acts
for each row execute function qdu_dbd_test_results_trigger_acts_fn();

create or replace trigger qdu_dbd_test_results_trigger_acts_tags
after insert on acts_tags
for each row execute function qdu_dbd_test_results_trigger_acts_tags_fn();
