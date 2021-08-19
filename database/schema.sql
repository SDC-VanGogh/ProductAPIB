
-- DROP DATABASE "productAPI";
-- DROP TABLE public.product;
-- DROP TABLE public.cart;
-- DROP TABLE public.features;
-- DROP TABLE public.photos;
-- DROP TABLE public.related;
-- DROP TABLE public.skus;
-- DROP TABLE public.styles;

-----------------------------------------------------------

-- CREATE DATABASE "productAPI"
--     WITH
--     OWNER = soph
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'C'
--     LC_CTYPE = 'C'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;

-----------------------------------------------------------

-- CREATE TABLE public.product
-- (
--     id numeric NOT NULL,
--     name text COLLATE pg_catalog."default" NOT NULL,
--     slogan text COLLATE pg_catalog."default" NOT NULL,
--     description text COLLATE pg_catalog."default" NOT NULL,
--     category text COLLATE pg_catalog."default" NOT NULL,
--     default_price text NOT NULL,
--     CONSTRAINT product_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;
-- ALTER TABLE public.product
--     OWNER to soph;
-- COPY product(id, name, slogan, description, category, default_price)
-- FROM '/Users/soph/Downloads/product.csv'
-- DELIMITER ','
-- CSV HEADER;



-- CREATE TABLE public.cart
-- (
--     id numeric NOT NULL,
--     user_session numeric NOT NULL,
--     product_id numeric NOT NULL,
--     active numeric NOT NULL,
--     PRIMARY KEY (id)
-- )
-- TABLESPACE pg_default;
-- COPY cart(id, user_session, product_id, active)
-- FROM '/Users/soph/Downloads/cart.csv'
-- DELIMITER ','
-- CSV HEADER;


-- CREATE TABLE public.features
-- (
--     id numeric NOT NULL,
--     product_id numeric NOT NULL,
--     feature text COLLATE pg_catalog."default" NOT NULL,
--     value text COLLATE pg_catalog."default",
--     CONSTRAINT features_pkey PRIMARY KEY (id),
--     CONSTRAINT product_id FOREIGN KEY (product_id)
--         REFERENCES public.product (id) MATCH SIMPLE
-- )
-- TABLESPACE pg_default;
-- ALTER TABLE public.features
--     OWNER to soph;
-- COPY features(id, product_id, feature, value)
-- FROM '/Users/soph/Downloads/features.csv'
-- DELIMITER ','
-- CSV HEADER;
-- CREATE INDEX product_idx ON features (product_id);


-- CREATE TABLE public.skus
-- (
--     id numeric NOT NULL,
--     styleId numeric NOT NULL,
--     size text COLLATE pg_catalog."default" NOT NULL,
--     quantity text COLLATE pg_catalog."default" NOT NULL,
--     PRIMARY KEY (id)
-- )
-- TABLESPACE pg_default;
-- ALTER TABLE public.skus
--     OWNER to soph;
-- COPY skus(id, styleId, size, quantity)
-- FROM '/Users/soph/Downloads/skus.csv'
-- DELIMITER ','
-- CSV HEADER;
-- CREATE INDEX sku_idx ON skus (styleId);


-- CREATE TABLE public.related
-- (
--     id numeric NOT NULL,
--     current_product_id numeric NOT NULL,
--     related_product_id numeric NOT NULL,
--     CONSTRAINT related_pkey PRIMARY KEY (id)
-- )
-- TABLESPACE pg_default;
-- ALTER TABLE public.related
--     OWNER to soph;
-- COPY related(id, current_product_id, related_product_id)
-- FROM '/Users/soph/Downloads/related.csv'
-- DELIMITER ','
-- CSV HEADER;


-- CREATE TABLE public.styles
-- (
--     id numeric NOT NULL,
--     productId numeric NOT NULL,
--     name text COLLATE pg_catalog."default" NOT NULL,
--     sale_price text COLLATE pg_catalog."default",
--     original_price text COLLATE pg_catalog."default" NOT NULL,
--     default_style text COLLATE pg_catalog."default" NOT NULL,
--     CONSTRAINT styles_pkey PRIMARY KEY (id),
--     CONSTRAINT product_id FOREIGN KEY (productId)
--         REFERENCES public.product (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
--         NOT VALID
-- )
-- TABLESPACE pg_default;
-- ALTER TABLE public.styles
--     OWNER to soph;
-- COPY styles(id, productId, name, sale_price, original_price, default_style)
-- FROM '/Users/soph/Downloads/styles.csv'
-- DELIMITER ','
-- CSV HEADER;
-- CREATE INDEX style_idx ON styles (productId);



-- CREATE TABLE public.photos
-- (
--     id numeric NOT NULL,
--     styleId numeric NOT NULL,
--     url text COLLATE pg_catalog."default" NOT NULL,
--     thumbnail_url text COLLATE pg_catalog."default" NOT NULL,
--     CONSTRAINT photos_pkey PRIMARY KEY (id),
--     CONSTRAINT style_id FOREIGN KEY (styleId)
--         REFERENCES public.styles (id) MATCH SIMPLE
-- )
-- TABLESPACE pg_default;
-- ALTER TABLE public.photos
--     OWNER to soph;
-- COPY photos(id, styleId, url, thumbnail_url)
-- FROM '/Users/soph/Downloads/photos.csv'
-- DELIMITER ','
-- CSV HEADER;
-- CREATE INDEX photo_idx ON photos (styleId);

-- COPY photos(id, styleId, url, thumbnail_url) FROM '/home/ubuntu/data/photos.csv'DELIMITER ','CSV HEADER;

-- CREATE INDEX product_idx ON features (product_id);
-- CREATE INDEX sku_idx ON skus (styleId);
-- CREATE INDEX style_idx ON styles (productId);
-- CREATE INDEX photo_idx ON photos (styleId);
