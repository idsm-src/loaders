create function substance_version(id in integer) returns varchar language sql as
$$
  select 'http://rdf.ncbi.nlm.nih.gov/pubchem/descriptor/SID' || id || '_Substance_Version';
$$
immutable;


create function substance_version_inverse(iri in varchar) returns integer language sql as
$$
  select regexp_replace(iri, '^http://rdf.ncbi.nlm.nih.gov/pubchem/descriptor/SID([0-9]+)_Substance_Version$', '\1')::integer;
$$
immutable;