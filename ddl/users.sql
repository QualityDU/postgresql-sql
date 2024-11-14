-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	user_id serial4 NOT NULL,
	passwd_hash varchar NOT NULL,
	"role" varchar DEFAULT '0'::character varying NOT NULL,
	ip_addr varchar NULL,
	registration_date date NOT NULL,
	last_login_date date NULL,
	username varchar NOT NULL,
	num_contributions int4 DEFAULT 0 NOT NULL,
	num_requests int4 DEFAULT 0 NOT NULL,
	karma int4 DEFAULT 0 NOT NULL,
	email varchar NOT NULL,
	email_verified bool DEFAULT false NOT NULL,
	email_verification_token varchar NOT NULL,
	sesskey_hash varchar NULL,
	last_usr_chng_date date NULL,
	sesskey_salt varchar NULL,
	passwd_salt varchar NULL,
	CONSTRAINT users_pk PRIMARY KEY (user_id),
	CONSTRAINT users_unique UNIQUE (username),
	CONSTRAINT users_unique_1 UNIQUE (email_verification_token)
);
