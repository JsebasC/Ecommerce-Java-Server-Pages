PGDMP     #    2                x         	   ecommerce    12.1    12.1 S    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16630 	   ecommerce    DATABASE     �   CREATE DATABASE ecommerce WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE ecommerce;
             	   ecommerce    false                        3079    16693    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �            1259    16633 
   categories    TABLE     -  CREATE TABLE public.categories (
    id bigint NOT NULL,
    published integer DEFAULT 0 NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.categories;
       public         heap 	   ecommerce    false            �           0    0    TABLE categories    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.categories TO ecommerce_admin;
GRANT SELECT ON TABLE public.categories TO ecommerce_client;
GRANT SELECT ON TABLE public.categories TO ecommerce_guest;
          public       	   ecommerce    false    204            �            1259    16631    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public       	   ecommerce    false    204            �           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public       	   ecommerce    false    203            �           0    0    SEQUENCE categories_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.categories_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.categories_id_seq TO ecommerce_client;
          public       	   ecommerce    false    203            �            1259    16647    products    TABLE     c  CREATE TABLE public.products (
    id bigint NOT NULL,
    published integer DEFAULT 0 NOT NULL,
    rating_cache double precision DEFAULT '3'::double precision NOT NULL,
    rating_count integer DEFAULT 0 NOT NULL,
    category_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    pricing double precision DEFAULT '0'::double precision NOT NULL,
    short_description character varying(255) NOT NULL,
    long_description text NOT NULL,
    icon character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.products;
       public         heap 	   ecommerce    false            �           0    0    TABLE products    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.products TO ecommerce_admin;
GRANT SELECT ON TABLE public.products TO ecommerce_client;
GRANT SELECT ON TABLE public.products TO ecommerce_guest;
          public       	   ecommerce    false    206            �            1259    16645    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       	   ecommerce    false    206            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public       	   ecommerce    false    205            �           0    0    SEQUENCE products_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.products_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.products_id_seq TO ecommerce_client;
          public       	   ecommerce    false    205            �            1259    16732    profiles    TABLE        CREATE TABLE public.profiles (
    id integer NOT NULL,
    name character varying(100),
    profile character varying(100)
);
    DROP TABLE public.profiles;
       public         heap 	   ecommerce    false            �           0    0    TABLE profiles    ACL     O   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.profiles TO ecommerce_admin;
          public       	   ecommerce    false    212            �            1259    16730    profiles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.profiles_id_seq;
       public       	   ecommerce    false    212            �           0    0    profiles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;
          public       	   ecommerce    false    211            �           0    0    SEQUENCE profiles_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.profiles_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.profiles_id_seq TO ecommerce_client;
          public       	   ecommerce    false    211            �            1259    16761    purchase_items    TABLE     A  CREATE TABLE public.purchase_items (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    product_id bigint NOT NULL,
    price double precision NOT NULL,
    quantity double precision NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
 "   DROP TABLE public.purchase_items;
       public         heap 	   ecommerce    false            �           0    0    TABLE purchase_items    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.purchase_items TO ecommerce_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.purchase_items TO ecommerce_client;
          public       	   ecommerce    false    215            �            1259    16766    purchase_items_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.purchase_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.purchase_items_id_seq;
       public       	   ecommerce    false    215            �           0    0    purchase_items_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.purchase_items_id_seq OWNED BY public.purchase_items.id;
          public       	   ecommerce    false    216            �           0    0    SEQUENCE purchase_items_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.purchase_items_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.purchase_items_id_seq TO ecommerce_client;
          public       	   ecommerce    false    216            �            1259    16768 	   purchases    TABLE     �   CREATE TABLE public.purchases (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.purchases;
       public         heap 	   ecommerce    false            �           0    0    TABLE purchases    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.purchases TO ecommerce_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.purchases TO ecommerce_client;
          public       	   ecommerce    false    217            �            1259    16773    purchases_id_seq    SEQUENCE     y   CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.purchases_id_seq;
       public       	   ecommerce    false    217            �           0    0    purchases_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;
          public       	   ecommerce    false    218            �           0    0    SEQUENCE purchases_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.purchases_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.purchases_id_seq TO ecommerce_client;
          public       	   ecommerce    false    218            �            1259    16680    reviews    TABLE     x  CREATE TABLE public.reviews (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL,
    rating double precision NOT NULL,
    comment text NOT NULL,
    approved integer DEFAULT 1 NOT NULL,
    spam integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.reviews;
       public         heap 	   ecommerce    false            �           0    0    TABLE reviews    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reviews TO ecommerce_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.reviews TO ecommerce_client;
GRANT SELECT ON TABLE public.reviews TO ecommerce_guest;
          public       	   ecommerce    false    210            �            1259    16678    reviews_id_seq    SEQUENCE     w   CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public       	   ecommerce    false    210            �           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public       	   ecommerce    false    209            �           0    0    SEQUENCE reviews_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.reviews_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.reviews_id_seq TO ecommerce_client;
          public       	   ecommerce    false    209            �            1259    16740    user_profiles    TABLE     i   CREATE TABLE public.user_profiles (
    id bigint NOT NULL,
    user_id bigint,
    profile_id bigint
);
 !   DROP TABLE public.user_profiles;
       public         heap 	   ecommerce    false            �           0    0    TABLE user_profiles    ACL     T   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.user_profiles TO ecommerce_admin;
          public       	   ecommerce    false    214            �            1259    16738    user_profiles_id_seq    SEQUENCE     }   CREATE SEQUENCE public.user_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.user_profiles_id_seq;
       public       	   ecommerce    false    214            �           0    0    user_profiles_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.user_profiles_id_seq OWNED BY public.user_profiles.id;
          public       	   ecommerce    false    213            �           0    0    SEQUENCE user_profiles_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.user_profiles_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.user_profiles_id_seq TO ecommerce_client;
          public       	   ecommerce    false    213            �            1259    16669    users    TABLE     [  CREATE TABLE public.users (
    id bigint NOT NULL,
    user_type integer DEFAULT 0 NOT NULL,
    username character varying(128) NOT NULL,
    email character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.users;
       public         heap 	   ecommerce    false            �           0    0    TABLE users    ACL     L   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO ecommerce_admin;
          public       	   ecommerce    false    208            �            1259    16667    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       	   ecommerce    false    208            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public       	   ecommerce    false    207            �           0    0    SEQUENCE users_id_seq    ACL     �   GRANT SELECT,USAGE ON SEQUENCE public.users_id_seq TO ecommerce_admin;
GRANT SELECT,USAGE ON SEQUENCE public.users_id_seq TO ecommerce_client;
          public       	   ecommerce    false    207            �
           2604    16775    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    203    204    204            �
           2604    16776    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    205    206    206            �
           2604    16777    profiles id    DEFAULT     j   ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);
 :   ALTER TABLE public.profiles ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    211    212    212            �
           2604    16778    purchase_items id    DEFAULT     v   ALTER TABLE ONLY public.purchase_items ALTER COLUMN id SET DEFAULT nextval('public.purchase_items_id_seq'::regclass);
 @   ALTER TABLE public.purchase_items ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    216    215            �
           2604    16779    purchases id    DEFAULT     l   ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);
 ;   ALTER TABLE public.purchases ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    218    217            �
           2604    16780 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    210    209    210            �
           2604    16781    user_profiles id    DEFAULT     t   ALTER TABLE ONLY public.user_profiles ALTER COLUMN id SET DEFAULT nextval('public.user_profiles_id_seq'::regclass);
 ?   ALTER TABLE public.user_profiles ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    213    214    214            �
           2604    16782    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       	   ecommerce    false    207    208    208            �          0    16633 
   categories 
   TABLE DATA           W   COPY public.categories (id, published, name, icon, created_at, updated_at) FROM stdin;
    public       	   ecommerce    false    204   Z`       �          0    16647    products 
   TABLE DATA           �   COPY public.products (id, published, rating_cache, rating_count, category_id, name, pricing, short_description, long_description, icon, created_at, updated_at) FROM stdin;
    public       	   ecommerce    false    206   �`       �          0    16732    profiles 
   TABLE DATA           5   COPY public.profiles (id, name, profile) FROM stdin;
    public       	   ecommerce    false    212   �a       �          0    16761    purchase_items 
   TABLE DATA           n   COPY public.purchase_items (id, purchase_id, product_id, price, quantity, created_at, updated_at) FROM stdin;
    public       	   ecommerce    false    215   �a       �          0    16768 	   purchases 
   TABLE DATA           H   COPY public.purchases (id, user_id, created_at, updated_at) FROM stdin;
    public       	   ecommerce    false    217   "b       �          0    16680    reviews 
   TABLE DATA           s   COPY public.reviews (id, product_id, user_id, rating, comment, approved, spam, created_at, updated_at) FROM stdin;
    public       	   ecommerce    false    210   `b       �          0    16740    user_profiles 
   TABLE DATA           @   COPY public.user_profiles (id, user_id, profile_id) FROM stdin;
    public       	   ecommerce    false    214   Mc       �          0    16669    users 
   TABLE DATA           a   COPY public.users (id, user_type, username, email, password, created_at, updated_at) FROM stdin;
    public       	   ecommerce    false    208   ~c       �           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 7, true);
          public       	   ecommerce    false    203            �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 15, true);
          public       	   ecommerce    false    205            �           0    0    profiles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.profiles_id_seq', 2, true);
          public       	   ecommerce    false    211            �           0    0    purchase_items_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.purchase_items_id_seq', 21, true);
          public       	   ecommerce    false    216            �           0    0    purchases_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.purchases_id_seq', 16, true);
          public       	   ecommerce    false    218            �           0    0    reviews_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reviews_id_seq', 41, true);
          public       	   ecommerce    false    209            �           0    0    user_profiles_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.user_profiles_id_seq', 4, true);
          public       	   ecommerce    false    213            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public       	   ecommerce    false    207            �
           2606    16644    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         	   ecommerce    false    204            �
           2606    16737    profiles group_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.profiles DROP CONSTRAINT group_pkey;
       public         	   ecommerce    false    212            �
           2606    16661    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         	   ecommerce    false    206            �
           2606    16784 "   purchase_items purchase_items_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.purchase_items
    ADD CONSTRAINT purchase_items_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.purchase_items DROP CONSTRAINT purchase_items_pkey;
       public         	   ecommerce    false    215            �
           2606    16786    purchases purchases_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.purchases DROP CONSTRAINT purchases_pkey;
       public         	   ecommerce    false    217            �
           2606    16692    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public         	   ecommerce    false    210            �
           2606    16745     user_profiles user_profiles_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT user_profiles_pkey;
       public         	   ecommerce    false    214            �
           2606    16677    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         	   ecommerce    false    208            �
           2606    16662 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public       	   ecommerce    false    2798    206    204                        2606    16792 .   purchase_items purchase_items_purchase_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase_items
    ADD CONSTRAINT purchase_items_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchases(id);
 X   ALTER TABLE ONLY public.purchase_items DROP CONSTRAINT purchase_items_purchase_id_fkey;
       public       	   ecommerce    false    217    2812    215                       2606    16797     purchases purchases_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.purchases DROP CONSTRAINT purchases_user_id_fkey;
       public       	   ecommerce    false    208    2802    217            �
           2606    16746 (   user_profiles user_profiles_profile_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_profile_fkey FOREIGN KEY (profile_id) REFERENCES public.profiles(id);
 R   ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT user_profiles_profile_fkey;
       public       	   ecommerce    false    214    2806    212            �
           2606    16751 %   user_profiles user_profiles_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_user_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 O   ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT user_profiles_user_fkey;
       public       	   ecommerce    false    208    2802    214            �   Y   x���4�t�/*J,�L�PFF���F&
F�V&�V��z&F&&f�x��,��8�pN��,F3�������R�������W� � Y      �   �   x�}�K
�0D��)|�I�'�nz�nԤ������M?����, ��i`[:2v�?c1�<tS{��\����&�p�p0��<�F���k�9�NQ�����Kj/C��!�d����"K�Ղ���a�86u�P��H�[���>E�8��(�4�������m��0�f���QJ= �`      �   <   x�3�tL����,.)JL�/�tt����	r��2�t��L�+I�t��t������ ��      �   9   x�32�44�44�43 N#N##]#]cCC+#+CS=#3sS<R\1z\\\ �kg      �   .   x�34�4�4202�50�50V04�21�24�32654�-����� _m      �   �   x����N1Ek�+B�DN�<�-�h�Ch������x� �B�TW�ؾ��Fڼ w�s:^��ɜ���6�8 ��i ?G5p�dK������ԬeӶ���ќ_��u���T
VDB�	9�yp��AQ�<���LW�z��,ܑ��:���?�U��(w$'��0��%�]`���.�c�H(:aXo�7������qn��)���d�
��#�E�/�-u�      �   !   x�3�4�4�2�B.cNc �Hq��qqq 4Vr      �   �   x����
�@��s݀�̧�BQa)FHI�)'P�&-���Ԧ��wsGS�R�H��8n�Kɻy\�4�WQ(yjJ�K����y��ѷ,�P�	�I5SױA���	AOL�l(�7iYs)���rE���:i3�e�k�H{1�	�E�sOxt��+i2e:�!�n�3F��tY�     