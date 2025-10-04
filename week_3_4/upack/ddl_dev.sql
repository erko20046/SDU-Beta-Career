-- dev
create table marketplaces.upack_categories
(
    category_id  smallint not null
        primary key,
    parent_id    smallint
        references marketplaces.upack_categories,
    name         text,
    category_url text,
    prod_id      smallint,
    priority     smallint,
    unique (name, parent_id)
);

comment on table marketplaces.upack_categories is 'upack';

alter table marketplaces.upack_categories
    owner to administrator;


create table marketplaces.upack_characteristics
(
    id             serial
        primary key,
    source_code    text,
    characteristic text,
    value          text,
    unique (source_code, characteristic)
);

comment on table marketplaces.upack_characteristics is 'upack';

alter table marketplaces.upack_characteristics
    owner to administrator;

create table marketplaces.upack_pictures
(
    id          serial
        primary key,
    source_code text,
    image_url   text,
    path        text,
    unique (source_code, path)
);

comment on table marketplaces.upack_pictures is 'upack';

alter table marketplaces.upack_pictures
    owner to administrator;

create table marketplaces.upack_products
(
    id                bigserial
        primary key,
    source_code       text
        unique,
    title             text,
    category_id       smallint not null
        references marketplaces.upack_categories,
    product_url       text,
    per_price         numeric(10, 2),
    quantity_per_box  integer,
    quantity_per_pack integer,
    min_quantity      integer,
    min_batch_price   numeric(10, 2)
);

comment on table marketplaces.upack_products is 'upack';

alter table marketplaces.upack_products
    owner to administrator;