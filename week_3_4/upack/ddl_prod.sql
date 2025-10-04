-- prod
create table marketplaces.upack_categories
(
    id           smallint generated always as identity
        primary key,
    parent_id    smallint
        references marketplaces.upack_categories,
    name         text     not null,
    category_url text     not null,
    level        smallint not null,
    is_active    boolean,
    created_at   timestamp default now(),
    relevance    timestamp default now(),
    unique (name, parent_id)
);

alter table marketplaces.upack_categories
    owner to bbekhoja;

create table marketplaces.upack_images
(
    id         bigserial
        primary key,
    product_id bigint not null
        references marketplaces.upack_products,
    image_url  text   not null,
    file_path  text   not null
        unique,
    created_at timestamp default now(),
    relevance  timestamp default now(),
    unique (product_id, file_path)
);

alter table marketplaces.upack_images
    owner to bbekhoja;

create table marketplaces.upack_product_characteristics
(
    id                bigserial
        primary key,
    product_id        bigint not null
        references marketplaces.upack_products,
    characteristic_id bigint not null
        references marketplaces.attributes,
    value             text   not null,
    created_at        timestamp default now(),
    relevance         timestamp default now(),
    unique (product_id, characteristic_id)
);

alter table marketplaces.upack_product_characteristics
    owner to bbekhoja;

create table marketplaces.upack_products
(
    id                bigint generated always as identity
        primary key,
    source_code       text           not null
        unique,
    name              text           not null,
    category_id       smallint       not null
        references marketplaces.upack_categories,
    product_url       text           not null
        unique,
    per_price         numeric(10, 2) not null,
    quantity_per_box  integer        not null,
    quantity_per_pack integer        not null,
    min_quantity      integer        not null,
    min_batch_price   numeric(10, 2) not null,
    created_at        timestamp default now(),
    relevance         timestamp default now()
);

alter table marketplaces.upack_products
    owner to bbekhoja;