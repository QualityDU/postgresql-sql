-- public.acts_tags definition

-- Drop table

-- DROP TABLE public.acts_tags;

CREATE TABLE public.acts_tags (
	id serial4 NOT NULL,
	act_id int4 NOT NULL,
	tag_id int4 NOT NULL,
	assigned_date date NOT NULL,
	assigner_id int4 NULL,
	CONSTRAINT acts_tags_pk PRIMARY KEY (id),
	CONSTRAINT "act_id_FK" FOREIGN KEY (act_id) REFERENCES public.acts(act_id),
	CONSTRAINT "assigner_id_FK" FOREIGN KEY (assigner_id) REFERENCES public.users(user_id),
	CONSTRAINT "tag_id_FK" FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id)
);
