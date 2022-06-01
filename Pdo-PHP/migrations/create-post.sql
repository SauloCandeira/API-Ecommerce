-- Table: public.anuncio

-- DROP TABLE public.anuncio;

CREATE TABLE public.anuncio
(
  id integer NOT NULL DEFAULT nextval('anuncio_id_seq'::regclass),
  fase "char" NOT NULL,
  tipo "char" NOT NULL,
  porte "char" NOT NULL,
  sexo "char" NOT NULL,
  pelagem_cor character varying NOT NULL,
  raca character varying NOT NULL,
  observacao text,
  email_usuario character varying(50) NOT NULL,
  CONSTRAINT id PRIMARY KEY (id),
  CONSTRAINT fk_email_usuario FOREIGN KEY (email_usuario)
      REFERENCES public.usuario (email) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.anuncio
  OWNER TO postgres;

-- Index: public.fki_email_usuario

-- DROP INDEX public.fki_email_usuario;

CREATE INDEX fki_email_usuario
  ON public.anuncio
  USING btree
  (email_usuario COLLATE pg_catalog."default");
