-- public.act_update_comments definition

-- Drop table

-- DROP TABLE public.act_update_comments;

CREATE TABLE public.act_update_comments (
	id serial4 NOT NULL,
	posted_date date NOT NULL,
	num_views int4 DEFAULT 0 NOT NULL,
	last_viewed_date date NULL,
	"content" varchar NOT NULL,
	act_update_id int4 NOT NULL,
	poster_id int4 NOT NULL,
	CONSTRAINT act_update_comments_pk PRIMARY KEY (id),
	CONSTRAINT "act_update_id_FK" FOREIGN KEY (act_update_id) REFERENCES public.act_updates(id),
	CONSTRAINT "poster_id_FK" FOREIGN KEY (poster_id) REFERENCES public.users(user_id)
);
