create table descriptor_compound_bases
(
    compound                        integer not null,
    hydrogen_bond_acceptor_count    smallint,
    tautomer_count                  smallint,
    defined_atom_stereo_count       smallint,
    defined_bond_stereo_count       smallint,
    undefined_bond_stereo_count     smallint,
    isotope_atom_count              smallint,
    covalent_unit_count             smallint,
    hydrogen_bond_donor_count       smallint,
    non_hydrogen_atom_count         smallint,
    rotatable_bond_count            smallint,
    undefined_atom_stereo_count     smallint,
    total_formal_charge             smallint,
    structure_complexity            float,
    mono_isotopic_weight            float,
    xlogp3_aa                       float,
    exact_mass                      float,
    molecular_weight                float,
    tpsa                            float,
    primary key(compound)
);


create table descriptor_compound_molecular_formulas
(
    compound             integer not null,
    molecular_formula    varchar not null,
    primary key(compound)
);


create table descriptor_compound_isomeric_smileses
(
    compound           integer not null,
    isomeric_smiles    varchar not null,
    primary key(compound)
);


create table descriptor_compound_canonical_smileses
(
    compound            integer not null,
    canonical_smiles    varchar not null,
    primary key(compound)
);


create table descriptor_compound_iupac_inchis
(
    compound       integer not null,
    iupac_inchi    varchar not null,
    primary key(compound)
);


create table descriptor_compound_iupac_inchis_long
(
    compound       integer not null,
    iupac_inchi    long varchar not null,
    primary key(compound)
);


create table descriptor_compound_preferred_iupac_names
(
    compound                integer not null,
    preferred_iupac_name    nvarchar not null,
    primary key(compound)
);


create table descriptor_compound_preferred_iupac_names_long
(
    compound                integer not null,
    preferred_iupac_name    long nvarchar not null,
    primary key(compound)
);