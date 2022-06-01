-- Table: public.usuario

-- DROP TABLE public.usuario;

CREATE TABLE public.usuario
(
  nome character varying(100) NOT NULL,
  email character varying(50) NOT NULL,
  telefone character varying(20) NOT NULL,
  senha character varying(50) NOT NULL,
  data_nascimento date NOT NULL,
  CONSTRAINT usuario_pkey PRIMARY KEY (email)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.usuario
  OWNER TO postgres;
