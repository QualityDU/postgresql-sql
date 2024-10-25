-- public.tags definition

-- Drop table

-- DROP TABLE public.tags;

CREATE TABLE public.tags (
	tag_id serial4 NOT NULL,
	"name" varchar NOT NULL,
	num_assigned int4 DEFAULT 0 NOT NULL,
	creator_id int4 NULL,
	date_created date NOT NULL,
	last_assigned_date date NULL,
	CONSTRAINT tags_pk PRIMARY KEY (tag_id),
	CONSTRAINT tags_unique UNIQUE (name),
	CONSTRAINT "creator_id_FK" FOREIGN KEY (creator_id) REFERENCES public.users(user_id)
);
