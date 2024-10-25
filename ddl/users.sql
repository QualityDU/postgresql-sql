-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	user_id serial4 NOT NULL,
	passwd_hash varchar NOT NULL,
	"role" varchar DEFAULT '0'::character varying NOT NULL,
	ipv4_addr varchar NOT NULL,
	ipv6_addr varchar NOT NULL,
	registration_date date NOT NULL,
	last_login_date date NULL,
	username varchar NOT NULL,
	num_contributions int4 DEFAULT 0 NOT NULL,
	num_requests int4 DEFAULT 0 NOT NULL,
	karma int4 DEFAULT 0 NOT NULL,
	email varchar NULL,
	email_verified bool DEFAULT false NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (user_id),
	CONSTRAINT users_unique UNIQUE (username)
);
