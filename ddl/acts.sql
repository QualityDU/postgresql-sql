-- public.acts definition

-- Drop table

-- DROP TABLE public.acts;

CREATE TABLE public.acts (
	du_code varchar NOT NULL,
	"year" int4 NOT NULL,
	journal_no int4 NULL,
	num_edits int4 DEFAULT 0 NOT NULL,
	text_payload varchar NOT NULL,
	date_scraped date NOT NULL,
	act_id serial4 NOT NULL,
	last_edited_date date NULL,
	last_tag_added_date date NULL,
	CONSTRAINT acts_pk PRIMARY KEY (act_id)
);
