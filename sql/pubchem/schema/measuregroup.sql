create table pubchem.measuregroup_bases
(
    bioassay        integer not null,
    measuregroup    integer not null,
    source          smallint,
    title           varchar,
    primary key(bioassay, measuregroup)
);


create table pubchem.measuregroup_proteins
(
    bioassay        integer not null,
    measuregroup    integer not null,
    protein         integer not null,
    primary key(bioassay, measuregroup, protein)
);


create table pubchem.measuregroup_genes
(
    bioassay        integer not null,
    measuregroup    integer not null,
    gene            integer not null,
    primary key(bioassay, measuregroup, gene)
);