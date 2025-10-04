-- prod
create table marketplaces.fortemarket_categories
(
    id           smallint generated always as identity
        primary key,
    parent_id    smallint
        references marketplaces.fortemarket_categories,
    name         text     not null,
    category_url text     not null,
    level        smallint not null,
    is_active    boolean  not null,
    created_at   timestamp default now(),
    relevance    timestamp default now(),
    unique (name, parent_id)
);

alter table marketplaces.fortemarket_categories
    owner to bbekhoja;

create table marketplaces.fortemarket_images
(
    id         bigint generated always as identity
        primary key,
    product_id bigint not null
        references marketplaces.fortemarket_products,
    image_url  text   not null,
    file_path  text   not null
        unique,
    created_at timestamp default now(),
    relevance  timestamp default now()
);

alter table marketplaces.fortemarket_images
    owner to bbekhoja;

create table marketplaces.fortemarket_product_characteristics
(
    id           bigint generated always as identity
        primary key,
    product_id   bigint not null
        references marketplaces.fortemarket_products,
    attribute_id bigint not null
        references marketplaces.attributes,
    value        text   not null,
    created_at   timestamp default now(),
    relevance    timestamp default now(),
    constraint fortemarket_product_character_product_id_attribute_id_value_key
        unique (product_id, attribute_id, value)
);

alter table marketplaces.fortemarket_product_characteristics
    owner to bbekhoja;


create table marketplaces.fortemarket_product_suppliers
(
    id          bigint generated always as identity
        primary key,
    product_id  bigint  not null
        references marketplaces.fortemarket_products,
    supplier_id integer not null
        references marketplaces.fortemarket_suppliers,
    price       integer not null,
    created_at  timestamp default now(),
    relevance   timestamp default now(),
    unique (product_id, supplier_id)
);

alter table marketplaces.fortemarket_product_suppliers
    owner to bbekhoja;


create table marketplaces.fortemarket_products
(
    id          bigint generated always as identity
        primary key,
    source_id   bigint,
    name        text     not null,
    category_id smallint not null
        references marketplaces.fortemarket_categories,
    product_url text     not null
        unique,
    min_price   integer  not null,
    description text,
    created_at  timestamp default now(),
    relevance   timestamp default now()
);

alter table marketplaces.fortemarket_products
    owner to bbekhoja;

create table marketplaces.fortemarket_suppliers
(
    id         integer generated always as identity
        primary key,
    source_id  text not null
        unique,
    name       text not null,
    created_at timestamp default now(),
    relevance  timestamp default now()
);

alter table marketplaces.fortemarket_suppliers
    owner to bbekhoja;