PGDMP     8    /                {           BankCreditPortfolio    14.0    14.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    73752    BankCreditPortfolio    DATABASE     r   CREATE DATABASE "BankCreditPortfolio" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
 %   DROP DATABASE "BankCreditPortfolio";
                postgres    false            �            1259    73753    borrower    TABLE     �   CREATE TABLE public.borrower (
    id integer NOT NULL,
    name "char",
    address "char",
    phone_number "char",
    email "char",
    date_of_birth date
);
    DROP TABLE public.borrower;
       public         heap    postgres    false            �            1259    73758 	   borrowing    TABLE        CREATE TABLE public.borrowing (
    id integer NOT NULL,
    credit_name "char",
    interest_rate numeric,
    term "char"
);
    DROP TABLE public.borrowing;
       public         heap    postgres    false            �            1259    73777    credit_request    TABLE     �   CREATE TABLE public.credit_request (
    id integer NOT NULL,
    borrower_id integer NOT NULL,
    borrowing_id integer NOT NULL,
    date_of_taking date,
    end_date date,
    credit_amount numeric
);
 "   DROP TABLE public.credit_request;
       public         heap    postgres    false            �            1259    73772    credit_taking    TABLE     c   CREATE TABLE public.credit_taking (
    request_id integer NOT NULL,
    confirmation_date date
);
 !   DROP TABLE public.credit_taking;
       public         heap    postgres    false            �            1259    73819    json_reimbursement_schemes    TABLE     ]   CREATE TABLE public.json_reimbursement_schemes (
    id integer NOT NULL,
    scheme text
);
 .   DROP TABLE public.json_reimbursement_schemes;
       public         heap    postgres    false            �            1259    73765    return    TABLE     h   CREATE TABLE public.return (
    scheme_id integer NOT NULL,
    date date,
    return_value numeric
);
    DROP TABLE public.return;
       public         heap    postgres    false            �            1259    73799    return_scheme    TABLE     �   CREATE TABLE public.return_scheme (
    borrower_id integer NOT NULL,
    borrowing_id integer NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE public.return_scheme;
       public         heap    postgres    false                      0    73753    borrower 
   TABLE DATA           Y   COPY public.borrower (id, name, address, phone_number, email, date_of_birth) FROM stdin;
    public          postgres    false    209   �"                 0    73758 	   borrowing 
   TABLE DATA           I   COPY public.borrowing (id, credit_name, interest_rate, term) FROM stdin;
    public          postgres    false    210   �"                 0    73777    credit_request 
   TABLE DATA           p   COPY public.credit_request (id, borrower_id, borrowing_id, date_of_taking, end_date, credit_amount) FROM stdin;
    public          postgres    false    213   �"                 0    73772    credit_taking 
   TABLE DATA           F   COPY public.credit_taking (request_id, confirmation_date) FROM stdin;
    public          postgres    false    212   �"                 0    73819    json_reimbursement_schemes 
   TABLE DATA           @   COPY public.json_reimbursement_schemes (id, scheme) FROM stdin;
    public          postgres    false    215   #                 0    73765    return 
   TABLE DATA           ?   COPY public.return (scheme_id, date, return_value) FROM stdin;
    public          postgres    false    211   *#                 0    73799    return_scheme 
   TABLE DATA           F   COPY public.return_scheme (borrower_id, borrowing_id, id) FROM stdin;
    public          postgres    false    214   G#       v           2606    73764    borrowing borrowing_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.borrowing
    ADD CONSTRAINT borrowing_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.borrowing DROP CONSTRAINT borrowing_pkey;
       public            postgres    false    210            z           2606    73783 "   credit_request credit_request_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.credit_request
    ADD CONSTRAINT credit_request_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.credit_request DROP CONSTRAINT credit_request_pkey;
       public            postgres    false    213            x           2606    73776     credit_taking credit_taking_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.credit_taking
    ADD CONSTRAINT credit_taking_pkey PRIMARY KEY (request_id);
 J   ALTER TABLE ONLY public.credit_taking DROP CONSTRAINT credit_taking_pkey;
       public            postgres    false    212            ~           2606    73825 :   json_reimbursement_schemes json_reimbursement_schemes_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.json_reimbursement_schemes
    ADD CONSTRAINT json_reimbursement_schemes_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.json_reimbursement_schemes DROP CONSTRAINT json_reimbursement_schemes_pkey;
       public            postgres    false    215            t           2606    73757    borrower provider_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.borrower
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.borrower DROP CONSTRAINT provider_pkey;
       public            postgres    false    209            |           2606    73813     return_scheme return_scheme_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.return_scheme
    ADD CONSTRAINT return_scheme_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.return_scheme DROP CONSTRAINT return_scheme_pkey;
       public            postgres    false    214            �           2606    73784    credit_request borrower_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_request
    ADD CONSTRAINT borrower_id FOREIGN KEY (borrower_id) REFERENCES public.borrower(id) NOT VALID;
 D   ALTER TABLE ONLY public.credit_request DROP CONSTRAINT borrower_id;
       public          postgres    false    209    213    3188            �           2606    73802    return_scheme borrower_id    FK CONSTRAINT        ALTER TABLE ONLY public.return_scheme
    ADD CONSTRAINT borrower_id FOREIGN KEY (borrower_id) REFERENCES public.borrower(id);
 C   ALTER TABLE ONLY public.return_scheme DROP CONSTRAINT borrower_id;
       public          postgres    false    3188    214    209            �           2606    73789    credit_request borrowing_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_request
    ADD CONSTRAINT borrowing_id FOREIGN KEY (borrowing_id) REFERENCES public.borrowing(id) NOT VALID;
 E   ALTER TABLE ONLY public.credit_request DROP CONSTRAINT borrowing_id;
       public          postgres    false    3190    210    213            �           2606    73807    return_scheme borrowing_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.return_scheme
    ADD CONSTRAINT borrowing_id FOREIGN KEY (borrower_id) REFERENCES public.borrowing(id);
 D   ALTER TABLE ONLY public.return_scheme DROP CONSTRAINT borrowing_id;
       public          postgres    false    3190    214    210            �           2606    73794    credit_taking request_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.credit_taking
    ADD CONSTRAINT request_id FOREIGN KEY (request_id) REFERENCES public.credit_request(id) NOT VALID;
 B   ALTER TABLE ONLY public.credit_taking DROP CONSTRAINT request_id;
       public          postgres    false    212    213    3194                       2606    73814    return scheme_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.return
    ADD CONSTRAINT scheme_id FOREIGN KEY (scheme_id) REFERENCES public.return_scheme(id) NOT VALID;
 :   ALTER TABLE ONLY public.return DROP CONSTRAINT scheme_id;
       public          postgres    false    3196    214    211                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     