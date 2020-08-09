create table pubchem.gene_bases
(
    id           integer not null,
    title        varchar,
    description  varchar,
    primary key(id)
);


create table pubchem.gene_biosystems
(
    gene         integer not null,
    biosystem    integer not null,
    primary key(gene, biosystem)
);


create table pubchem.gene_alternatives
(
    __             integer,
    gene           integer not null,
    alternative    varchar not null,
    primary key(__)
);


create table pubchem.gene_references
(
    gene         integer not null,
    reference    integer not null,
    primary key(gene, reference)
);


create table pubchem.gene_matches
(
    __       integer,
    gene     integer not null,
    match    varchar not null,
    primary key(__)
);