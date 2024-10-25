-- public.act_updates definition

-- Drop table

-- DROP TABLE public.act_updates;

CREATE TABLE public.act_updates (
	id serial4 NOT NULL,
	issued_date date NOT NULL,
	completed_date date NULL,
	is_review_positive bool DEFAULT false NOT NULL,
	num_views int4 DEFAULT 0 NOT NULL,
	updater_id int4 NULL,
	reviewer_id int4 NULL,
	is_auto bool DEFAULT false NOT NULL,
	new_text_payload varchar NULL,
	last_viewed_date date NULL,
	act_id int4 NOT NULL,
	is_taglist_edit bool DEFAULT false NOT NULL,
	is_text_payload_edit bool DEFAULT false NOT NULL,
	CONSTRAINT act_updates_pk PRIMARY KEY (id),
	CONSTRAINT "act_id_FK" FOREIGN KEY (act_id) REFERENCES public.acts(act_id),
	CONSTRAINT "reviewer_id_FK" FOREIGN KEY (reviewer_id) REFERENCES public.users(user_id),
	CONSTRAINT "updater_id_FK" FOREIGN KEY (updater_id) REFERENCES public.users(user_id)
);
