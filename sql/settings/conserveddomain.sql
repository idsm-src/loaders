grant select on conserveddomain_bases to "SPARQL";

--------------------------------------------------------------------------------

create index conserveddomain_references__domain on conserveddomain_references(domain);
create index conserveddomain_references__reference on conserveddomain_references(reference);
grant select on conserveddomain_references to "SPARQL";
