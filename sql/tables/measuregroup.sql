log_enable(2);

--============================================================================--

create table measuregroup_bases
(
    bioassay        integer not null,
    measuregroup    integer not null,
    source          smallint,
    title           varchar,
    primary key(bioassay, measuregroup)
);


insert into measuregroup_bases(bioassay, measuregroup, source, title)
select
    coalesce(
        sprintf_inverse(t1.S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d', 0),
        sprintf_inverse(t1.S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_%U', 0)
    )[0] as bioassay,
    coalesce(
        -2147483647 + 0 * sprintf_inverse(t1.S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d', 2)[0],
        -1 * sprintf_inverse(t1.S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_%d', 2)[1],
        sprintf_inverse(t1.S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_PMID%d', 2)[1],
        0
    ) as measuregroup,
    rt.id as source,
    t2.title as title
from (
    sparql select distinct ?S from pubchem:measuregroup where
    {
        ?S [] [].
        filter(?S != measuregroup:AID493040)
    }
) as t1 left join (
    sparql select ?S ?title from pubchem:measuregroup where
    {
        ?S dcterms:title ?title
    }
) as t2 on t1.S = t2.S left join (
    sparql select ?S (str(str(?source)) as ?source) from pubchem:measuregroup where
    {
        ?S dcterms:source ?source
    }
) as t3 on t1.S = t3.S left join source_bases as rt on rt.iri = t3.source;


create index measuregroup_bases__bioassay on measuregroup_bases(bioassay);
create index measuregroup_bases__source on measuregroup_bases(source);
grant select on measuregroup_bases to "SPARQL";

--============================================================================--

create table measuregroup_proteins
(
    __              integer identity,
    bioassay        integer not null,
    measuregroup    integer not null,
    protein         varchar not null,
    primary key(__)
);


insert into measuregroup_proteins(bioassay, measuregroup, protein)
select
    coalesce(
        sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d', 0),
        sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_%U', 0)
    )[0] as bioassay,
    coalesce(
        -2147483647 + 0 * sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d', 2)[0],
        -1 * sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_%d', 2)[1],
        sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_PMID%d', 2)[1],
        0
    ) as measuregroup,
    sprintf_inverse(P, 'http://rdf.ncbi.nlm.nih.gov/pubchem/protein/%U', 0)[0] as protein
from (
    sparql select ?S ?P from pubchem:measuregroup where
    {
        ?S obo:BFO_0000057 ?P .
        filter(strstarts(str(?P), "http://rdf.ncbi.nlm.nih.gov/pubchem/protein/"))
        filter(?S != measuregroup:AID493040)
    }
) as tbl;


create index measuregroup_proteins__bioassay on measuregroup_proteins(bioassay);
create index measuregroup_proteins__bioassay_measuregroup on measuregroup_proteins(bioassay, measuregroup);
create index measuregroup_proteins__protein on measuregroup_proteins(protein);
grant select on measuregroup_proteins to "SPARQL";

--============================================================================--

create table measuregroup_genes
(
    bioassay        integer not null,
    measuregroup    integer not null,
    gene            integer not null,
    primary key(bioassay, measuregroup, gene)
);


insert into measuregroup_genes(bioassay, measuregroup, gene)
select
    coalesce(
        sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d', 0),
        sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_%U', 0)
    )[0] as bioassay,
    coalesce(
        -2147483647 + 0 * sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d', 2)[0],
        -1 * sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_%d', 2)[1],
        sprintf_inverse(S, 'http://rdf.ncbi.nlm.nih.gov/pubchem/measuregroup/AID%d_PMID%d', 2)[1],
        0
    ) as measuregroup,
    sprintf_inverse(P, 'http://rdf.ncbi.nlm.nih.gov/pubchem/gene/GID%d', 0)[0] as gene
from (
    sparql select ?S ?P from pubchem:measuregroup where
    {
        ?S obo:BFO_0000057 ?P .
        filter(strstarts(str(?P), "http://rdf.ncbi.nlm.nih.gov/pubchem/gene/"))
        filter(?S != measuregroup:AID493040)
    }
) as tbl;


create index measuregroup_genes__bioassay on measuregroup_genes(bioassay);
create index measuregroup_genes__bioassay_measuregroup on measuregroup_genes(bioassay, measuregroup);
create index measuregroup_genes__gene on measuregroup_genes(gene);
grant select on measuregroup_genes to "SPARQL";
