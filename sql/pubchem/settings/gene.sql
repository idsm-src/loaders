create index gene_bases__title on gene_bases(title);
create index gene_bases__description on gene_bases(description);
grant select on gene_bases to sparql;

--------------------------------------------------------------------------------

create index gene_biosystems__gene on gene_biosystems(gene);
create index gene_biosystems__biosystem on gene_biosystems(biosystem);
grant select on gene_biosystems to sparql;

--------------------------------------------------------------------------------

create index gene_alternatives__gene on gene_alternatives(gene);
create index gene_alternatives__alternative on gene_alternatives(alternative);
grant select on gene_alternatives to sparql;

--------------------------------------------------------------------------------

create index gene_references__gene on gene_references(gene);
create index gene_references__reference on gene_references(reference);
grant select on gene_references to sparql;

--------------------------------------------------------------------------------

create index gene_matches__gene on gene_matches(gene);
create index gene_matches__match on gene_matches(match);
grant select on gene_matches to sparql;