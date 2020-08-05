create table reference_bases
(
    id          integer not null,
    type_id     smallint not null,
    dcdate      date,
    title       varchar,
    citation    varchar,
    primary key(id)
);


create table reference_discusses
(
    reference   integer not null,
    statement   varchar not null,
    primary key(reference, statement)
);


create table reference_subjects
(
    reference   integer not null,
    subject     varchar not null,
    primary key(reference, subject)
);


create table reference_primary_subjects
(
    reference   integer not null,
    subject     varchar not null,
    primary key(reference, subject)
);
