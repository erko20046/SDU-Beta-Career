-- dev
create table marketplaces.fortemarket_categories
(
    id           smallint not null
        primary key,
    parent_id    smallint
        references marketplaces.fortemarket_categories,
    name         text     not null,
    category_url text,
    priority     smallint,
    prod_id      smallint,
    unique (name, parent_id)
);

comment on table marketplaces.fortemarket_categories is 'fortemarket';

alter table marketplaces.fortemarket_categories
    owner to administrator;

create table marketplaces.fortemarket_characteristics
(
    id             serial
        primary key,
    product_url    text not null
        references marketplaces.fortemarket_products (product_url),
    characteristic text not null,
    value          text not null
);

comment on table marketplaces.fortemarket_characteristics is 'fortemarket';

alter table marketplaces.fortemarket_characteristics
    owner to administrator;

create table marketplaces.fortemarket_merchants
(
    id          serial
        primary key,
    product_url text    not null
        references marketplaces.fortemarket_products (product_url),
    source_id   text    not null,
    name        text    not null,
    price       integer not null,
    unique (product_url, source_id)
);

comment on table marketplaces.fortemarket_merchants is 'fortemarket';

alter table marketplaces.fortemarket_merchants
    owner to administrator;

create table marketplaces.fortemarket_pictures
(
    id          serial
        primary key,
    product_url text not null
        references marketplaces.fortemarket_products (product_url),
    image_url   text not null,
    path        text not null
        unique
);

comment on table marketplaces.fortemarket_pictures is 'fortemarket';

alter table marketplaces.fortemarket_pictures
    owner to administrator;

create table marketplaces.fortemarket_products
(
    id          bigserial
        primary key,
    source_id   bigint,
    title       text     not null,
    min_price   integer  not null,
    category_id smallint not null
        references marketplaces.fortemarket_categories,
    product_url text     not null
        unique,
    description text
);

comment on table marketplaces.fortemarket_products is 'fortemarket';

alter table marketplaces.fortemarket_products
    owner to administrator;