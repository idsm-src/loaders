-- bioassay
alter table bioassay_bases add foreign key (source) references  source_bases(id);
alter table bioassay_data add foreign key (bioassay) references  bioassay_bases(id);


-- biosystem
alter table biosystem_bases add foreign key (source) references  source_bases(id);
alter table biosystem_components add foreign key (biosystem) references  biosystem_bases(id);
alter table biosystem_references add foreign key (biosystem) references  biosystem_bases(id);
alter table biosystem_references add foreign key (reference) references reference_bases(id);
alter table biosystem_matches add foreign key (biosystem) references  biosystem_bases(id);
--  175140 : alter table biosystem_components add foreign key (component) references  biosystem_bases(id);


-- compound
alter table compound_components add foreign key (compound) references compound_bases(id);
alter table compound_components add foreign key (component) references compound_bases(id);
alter table compound_isotopologues add foreign key (compound) references compound_bases(id);
alter table compound_isotopologues add foreign key (isotopologue) references compound_bases(id);
alter table compound_parents add foreign key (compound) references compound_bases(id);
alter table compound_parents add foreign key (parent) references compound_bases(id);
alter table compound_stereoisomers add foreign key (compound) references compound_bases(id);
alter table compound_stereoisomers add foreign key (isomer) references compound_bases(id);
alter table compound_same_connectivities add foreign key (compound) references compound_bases(id);
alter table compound_same_connectivities add foreign key (isomer) references compound_bases(id);
alter table compound_roles add foreign key (compound) references compound_bases(id);
alter table compound_biosystems add foreign key (compound) references compound_bases(id);
alter table compound_biosystems add foreign key (biosystem) references biosystem_bases(id);
alter table compound_types add foreign key (compound) references compound_bases(id);
alter table compound_active_ingredients add foreign key (compound) references compound_bases(id);


-- concept
alter table concept_bases add foreign key (scheme) references concept_bases(id);
alter table concept_bases add foreign key (broader) references concept_bases(id);


-- conserveddomain
alter table conserveddomain_references add foreign key (domain) references  conserveddomain_bases(id);
alter table conserveddomain_references add foreign key (reference) references reference_bases(id);


-- endpoint
alter table endpoint_measurements add foreign key (substance, bioassay, measuregroup) references endpoint_bases(substance, bioassay, measuregroup);
alter table endpoint_references add foreign key (reference) references reference_bases(id);
--  508564 : alter table endpoint_bases add foreign key (substance) references substance_bases(id);
--     276 : alter table endpoint_bases add foreign key (bioassay, measuregroup) references measuregroup_bases(bioassay, measuregroup);
alter table endpoint_references add foreign key (substance, bioassay, measuregroup) references endpoint_bases(substance, bioassay, measuregroup);
alter table endpoint_bases add foreign key (bioassay, measuregroup) references bioassay_measuregroups(bioassay, measuregroup);


-- gene
alter table gene_biosystems add foreign key (gene) references gene_bases(id);
alter table gene_biosystems add foreign key (biosystem) references biosystem_bases(id);
alter table gene_alternatives add foreign key (gene) references gene_bases(id);
alter table gene_references add foreign key (gene) references gene_bases(id);
alter table gene_references add foreign key (reference) references reference_bases(id);
alter table gene_matches add foreign key (gene) references gene_bases(id);


-- inchikey
alter table inchikey_compounds add foreign key (inchikey) references inchikey_bases(id);
alter table inchikey_subjects add foreign key (inchikey) references inchikey_bases(id);
alter table inchikey_compounds add foreign key (compound) references compound_bases(id);


-- measuregroup
alter table measuregroup_bases add foreign key (bioassay) references bioassay_bases(id);
alter table measuregroup_bases add foreign key (source) references source_bases(id);
alter table measuregroup_proteins add foreign key (protein) references protein_bases(id);
alter table measuregroup_genes add foreign key (gene) references gene_bases(id);
--      78 : alter table measuregroup_proteins add foreign key (bioassay, measuregroup) references measuregroup_bases(bioassay, measuregroup);
--       1 : alter table measuregroup_genes add foreign key (bioassay, measuregroup) references measuregroup_bases(bioassay, measuregroup);


-- protein
alter table protein_references add foreign key (protein) references protein_bases(id);
alter table protein_references add foreign key (reference) references reference_bases(id);
alter table protein_pdblinks add foreign key (protein) references protein_bases(id);
alter table protein_similarproteins add foreign key (protein) references protein_bases(id);
alter table protein_similarproteins add foreign key (simprotein) references protein_bases(id);
alter table protein_genes add foreign key (protein) references protein_bases(id);
--       1 : alter table protein_genes add foreign key (gene) references gene_bases(id);
alter table protein_closematches add foreign key (protein) references protein_bases(id);
alter table protein_conserveddomains add foreign key (protein) references protein_bases(id);
alter table protein_conserveddomains add foreign key (domain) references conserveddomain_bases(id);
alter table protein_continuantparts add foreign key (protein) references protein_bases(id);
alter table protein_continuantparts add foreign key (part) references protein_bases(id);
alter table protein_processes add foreign key (protein) references protein_bases(id);
alter table protein_biosystems add foreign key (protein) references protein_bases(id);
alter table protein_biosystems add foreign key (biosystem) references biosystem_bases(id);
alter table protein_functions add foreign key (protein) references protein_bases(id);
alter table protein_locations add foreign key (protein) references protein_bases(id);
alter table protein_types add foreign key (protein) references protein_bases(id);
alter table protein_complexes add foreign key (protein) references protein_bases(id);


-- reference
alter table reference_discusses add foreign key (reference) references reference_bases(id);
alter table reference_subject_descriptors add foreign key (reference) references reference_bases(id);


-- source
alter table source_subjects add foreign key (source) references source_bases(id);
alter table source_subjects add foreign key (subject) references concept_bases(id);
alter table source_alternatives add foreign key (source) references source_bases(id);


-- substance
alter table substance_bases add foreign key (source) references source_bases(id);
alter table substance_references add foreign key (reference) references reference_bases(id);
alter table substance_synonyms add foreign key (synonym) references synonym_bases(id);
alter table substance_bases add foreign key (compound) references compound_bases(id);
--  487849 : alter table substance_types add foreign key (substance) references substance_bases(id);
--    8484 : alter table substance_matches add foreign key (substance) references substance_bases(id);
--   15885 : alter table substance_references add foreign key (substance) references substance_bases(id);
--    1178 : alter table substance_pdblinks add foreign key (substance) references substance_bases(id);
-- 3239522 : alter table substance_synonyms add foreign key (substance) references substance_bases(id);


-- synonym
alter table synonym_values add foreign key (synonym) references synonym_bases(id);
alter table synonym_types add foreign key (synonym) references synonym_bases(id);
alter table synonym_compounds add foreign key (synonym) references synonym_bases(id);
alter table synonym_mesh_subjects add foreign key (synonym) references synonym_bases(id);
alter table synonym_concept_subjects add foreign key (synonym) references synonym_bases(id);
alter table synonym_concept_subjects add foreign key (concept) references concept_bases(id);
alter table synonym_compounds add foreign key (compound) references compound_bases(id);


-- descriptor-compound
alter table descriptor_compound_bases add foreign key (compound) references compound_bases(id);
alter table descriptor_compound_molecular_formulas add foreign key (compound) references compound_bases(id);
alter table descriptor_compound_isomeric_smileses add foreign key (compound) references compound_bases(id);
alter table descriptor_compound_canonical_smileses add foreign key (compound) references compound_bases(id);
alter table descriptor_compound_iupac_inchis add foreign key (compound) references compound_bases(id);
alter table descriptor_compound_preferred_iupac_names add foreign key (compound) references compound_bases(id);


-- descriptor-substance
--  9201097 : alter table descriptor_substance_bases add foreign key (substance) references substance_bases(id);


-- ontology
alter table ontology_resource_superclasses add foreign key (class_unit, class_id) references ontology_resource_classes(class_unit, class_id);
alter table ontology_resource_superclasses add foreign key (superclass_unit, superclass_id) references ontology_resource_classes(class_unit, class_id);
alter table ontology_resource_superproperties add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_superproperties add foreign key (superproperty_unit, superproperty_id) references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_domains add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_domains add foreign key (domain_unit, domain_id) references ontology_resource_classes(class_unit, class_id);
alter table ontology_resource_ranges add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_ranges add foreign key (range_unit, range_id) references ontology_resource_classes(class_unit, class_id);
alter table ontology_resource_somevaluesfrom_restrictions add foreign key (property_unit, property_id)  references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_somevaluesfrom_restrictions add foreign key (class_unit, class_id) references ontology_resource_classes(class_unit, class_id);
alter table ontology_resource_allvaluesfrom_restrictions add foreign key (property_unit, property_id)  references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_allvaluesfrom_restrictions add foreign key (class_unit, class_id) references ontology_resource_classes(class_unit, class_id);
alter table ontology_resource_cardinality_restrictions add foreign key (property_unit, property_id)  references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_mincardinality_restrictions add foreign key (property_unit, property_id)  references ontology_resource_properties(property_unit, property_id);
alter table ontology_resource_maxcardinality_restrictions add foreign key (property_unit, property_id)  references ontology_resource_properties(property_unit, property_id);
