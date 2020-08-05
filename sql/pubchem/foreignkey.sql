-- bioassay
alter table bioassay_bases add foreign key (source) references source_bases(id) initially deferred;
alter table bioassay_data add foreign key (bioassay) references bioassay_bases(id) initially deferred;


-- biosystem
alter table biosystem_bases add foreign key (source) references source_bases(id) initially deferred;
alter table biosystem_components add foreign key (biosystem) references biosystem_bases(id) initially deferred;
alter table biosystem_references add foreign key (biosystem) references biosystem_bases(id) initially deferred;
alter table biosystem_references add foreign key (reference) references reference_bases(id) initially deferred;
alter table biosystem_matches add foreign key (biosystem) references biosystem_bases(id) initially deferred;
-- 175140 : alter table biosystem_components add foreign key (component) references biosystem_bases(id) initially deferred;


-- compound
alter table compound_components add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_components add foreign key (component) references compound_bases(id) initially deferred;
alter table compound_isotopologues add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_isotopologues add foreign key (isotopologue) references compound_bases(id) initially deferred;
alter table compound_parents add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_parents add foreign key (parent) references compound_bases(id) initially deferred;
alter table compound_stereoisomers add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_stereoisomers add foreign key (isomer) references compound_bases(id) initially deferred;
alter table compound_same_connectivities add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_same_connectivities add foreign key (isomer) references compound_bases(id) initially deferred;
alter table compound_roles add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_biosystems add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_biosystems add foreign key (biosystem) references biosystem_bases(id) initially deferred;
alter table compound_types add foreign key (compound) references compound_bases(id) initially deferred;
alter table compound_active_ingredients add foreign key (compound) references compound_bases(id) initially deferred;
alter table molecules.pubchem add foreign key (id) references compound_bases(id) initially deferred;


-- concept
alter table concept_bases add foreign key (scheme) references concept_bases(id) initially deferred;
alter table concept_bases add foreign key (broader) references concept_bases(id) initially deferred;


-- conserveddomain
alter table conserveddomain_references add foreign key (domain) references conserveddomain_bases(id) initially deferred;
alter table conserveddomain_references add foreign key (reference) references reference_bases(id) initially deferred;


-- endpoint
alter table endpoint_measurements add foreign key (substance, bioassay, measuregroup) references endpoint_bases(substance, bioassay, measuregroup) initially deferred;
alter table endpoint_references add foreign key (reference) references reference_bases(id) initially deferred;
alter table endpoint_references add foreign key (substance, bioassay, measuregroup) references endpoint_bases(substance, bioassay, measuregroup) initially deferred;
alter table endpoint_outcomes add foreign key (substance) references substance_bases(id) initially deferred;
alter table endpoint_outcomes add foreign key (bioassay, measuregroup) references measuregroup_bases(bioassay, measuregroup) initially deferred;
alter table endpoint_outcomes add foreign key (substance, bioassay, measuregroup) references endpoint_bases(substance, bioassay, measuregroup) initially deferred;
alter table endpoint_bases add foreign key (substance) references substance_bases(id) initially deferred;
alter table endpoint_bases add foreign key (bioassay, measuregroup) references measuregroup_bases(bioassay, measuregroup) initially deferred;


-- gene
alter table gene_biosystems add foreign key (gene) references gene_bases(id) initially deferred;
alter table gene_biosystems add foreign key (biosystem) references biosystem_bases(id) initially deferred;
alter table gene_alternatives add foreign key (gene) references gene_bases(id) initially deferred;
alter table gene_references add foreign key (gene) references gene_bases(id) initially deferred;
alter table gene_references add foreign key (reference) references reference_bases(id) initially deferred;
alter table gene_matches add foreign key (gene) references gene_bases(id) initially deferred;


-- inchikey
alter table inchikey_compounds add foreign key (inchikey) references inchikey_bases(id) initially deferred;
alter table inchikey_subjects add foreign key (inchikey) references inchikey_bases(id) initially deferred;
alter table inchikey_compounds add foreign key (compound) references compound_bases(id) initially deferred;


-- measuregroup
alter table measuregroup_bases add foreign key (bioassay) references bioassay_bases(id) initially deferred;
alter table measuregroup_bases add foreign key (source) references source_bases(id) initially deferred;
alter table measuregroup_proteins add foreign key (protein) references protein_bases(id) initially deferred;
alter table measuregroup_genes add foreign key (gene) references gene_bases(id) initially deferred;
alter table measuregroup_proteins add foreign key (bioassay, measuregroup) references measuregroup_bases(bioassay, measuregroup) initially deferred;
alter table measuregroup_genes add foreign key (bioassay, measuregroup) references measuregroup_bases(bioassay, measuregroup) initially deferred;


-- protein
alter table protein_references add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_references add foreign key (reference) references reference_bases(id) initially deferred;
alter table protein_pdblinks add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_similarproteins add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_similarproteins add foreign key (simprotein) references protein_bases(id) initially deferred;
alter table protein_genes add foreign key (protein) references protein_bases(id) initially deferred;
-- 1 : alter table protein_genes add foreign key (gene) references gene_bases(id) initially deferred;
alter table protein_closematches add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_conserveddomains add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_conserveddomains add foreign key (domain) references conserveddomain_bases(id) initially deferred;
alter table protein_continuantparts add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_continuantparts add foreign key (part) references protein_bases(id) initially deferred;
alter table protein_processes add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_biosystems add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_biosystems add foreign key (biosystem) references biosystem_bases(id) initially deferred;
alter table protein_functions add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_locations add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_types add foreign key (protein) references protein_bases(id) initially deferred;
alter table protein_complexes add foreign key (protein) references protein_bases(id) initially deferred;


-- reference
alter table reference_discusses add foreign key (reference) references reference_bases(id) initially deferred;
alter table reference_subjects add foreign key (reference) references reference_bases(id) initially deferred;
alter table reference_primary_subjects add foreign key (reference) references reference_bases(id) initially deferred;


-- source
alter table source_subjects add foreign key (source) references source_bases(id) initially deferred;
alter table source_subjects add foreign key (subject) references concept_bases(id) initially deferred;
alter table source_alternatives add foreign key (source) references source_bases(id) initially deferred;


-- substance
alter table substance_bases add foreign key (source) references source_bases(id) initially deferred;
alter table substance_references add foreign key (reference) references reference_bases(id) initially deferred;
alter table substance_synonyms add foreign key (synonym) references synonym_bases(id) initially deferred;
alter table substance_bases add foreign key (compound) references compound_bases(id) initially deferred;
alter table substance_types add foreign key (substance) references substance_bases(id) initially deferred;
alter table substance_matches add foreign key (substance) references substance_bases(id) initially deferred;
alter table substance_references add foreign key (substance) references substance_bases(id) initially deferred;
alter table substance_pdblinks add foreign key (substance) references substance_bases(id) initially deferred;
alter table substance_synonyms add foreign key (substance) references substance_bases(id) initially deferred;


-- synonym
alter table synonym_values add foreign key (synonym) references synonym_bases(id) initially deferred;
alter table synonym_types add foreign key (synonym) references synonym_bases(id) initially deferred;
alter table synonym_compounds add foreign key (synonym) references synonym_bases(id) initially deferred;
alter table synonym_mesh_subjects add foreign key (synonym) references synonym_bases(id) initially deferred;
alter table synonym_concept_subjects add foreign key (synonym) references synonym_bases(id) initially deferred;
alter table synonym_concept_subjects add foreign key (concept) references concept_bases(id) initially deferred;
alter table synonym_compounds add foreign key (compound) references compound_bases(id) initially deferred;


-- descriptor-compound
alter table descriptor_compound_bases add foreign key (compound) references compound_bases(id) initially deferred;
alter table descriptor_compound_molecular_formulas add foreign key (compound) references compound_bases(id) initially deferred;
alter table descriptor_compound_isomeric_smileses add foreign key (compound) references compound_bases(id) initially deferred;
alter table descriptor_compound_canonical_smileses add foreign key (compound) references compound_bases(id) initially deferred;
alter table descriptor_compound_iupac_inchis add foreign key (compound) references compound_bases(id) initially deferred;
alter table descriptor_compound_preferred_iupac_names add foreign key (compound) references compound_bases(id) initially deferred;


-- descriptor-substance
alter table descriptor_substance_bases add foreign key (substance) references substance_bases(id) initially deferred;


-- ontology
alter table ontology_resource_superclasses add foreign key (class_unit, class_id) references ontology_resource_classes(class_unit, class_id) initially deferred;
alter table ontology_resource_superclasses add foreign key (superclass_unit, superclass_id) references ontology_resource_classes(class_unit, class_id) initially deferred;
alter table ontology_resource_superproperties add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_superproperties add foreign key (superproperty_unit, superproperty_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_domains add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_domains add foreign key (domain_unit, domain_id) references ontology_resource_classes(class_unit, class_id) initially deferred;
alter table ontology_resource_ranges add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_ranges add foreign key (range_unit, range_id) references ontology_resource_classes(class_unit, class_id) initially deferred;
alter table ontology_resource_somevaluesfrom_restrictions add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_somevaluesfrom_restrictions add foreign key (class_unit, class_id) references ontology_resource_classes(class_unit, class_id) initially deferred;
alter table ontology_resource_allvaluesfrom_restrictions add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_allvaluesfrom_restrictions add foreign key (class_unit, class_id) references ontology_resource_classes(class_unit, class_id) initially deferred;
alter table ontology_resource_cardinality_restrictions add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_mincardinality_restrictions add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;
alter table ontology_resource_maxcardinality_restrictions add foreign key (property_unit, property_id) references ontology_resource_properties(property_unit, property_id) initially deferred;