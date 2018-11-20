create table bioassay_bases
(
    id        integer not null,
    source    smallint not null,
    title     varchar not null,
    primary key(id)
);


create table bioassay_data
(
    __          integer,
    bioassay    integer not null,
    type_id     smallint not null,
    value       varchar not null,
    primary key(__)
);


create table bioassay_measuregroups
(
    bioassay        integer not null,
    measuregroup    integer not null,
    primary key(bioassay, measuregroup)
);
