-- public.act_update_tags definition

-- Drop table

-- DROP TABLE public.act_update_tags;

CREATE TABLE public.act_update_tags (
	id serial4 NOT NULL,
	tag_id int4 NOT NULL,
	act_update_id int4 NOT NULL,
	CONSTRAINT act_update_tags_pk PRIMARY KEY (id),
	CONSTRAINT "act_update_id_FK" FOREIGN KEY (act_update_id) REFERENCES public.act_updates(id),
	CONSTRAINT "tag_id_FK" FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id)
);
