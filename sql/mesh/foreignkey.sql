alter table mesh.alt_labels add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.previous_indexing_values add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.sources add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.thesauruses add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.labels add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.abbreviations add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.annotations add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.casn1_labels add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.consider_also_values add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.entry_versions add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.history_notes add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.last_active_years add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.lexical_tags add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.notese_notes add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.online_notes add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.pref_labels add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.public_mesh_notes add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.scope_notes add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.sort_versions add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.related_registry_numbers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.identifiers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.nlm_cassification_numbers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.registry_numbers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.created_dates add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.revised_dates add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.established_dates add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.active_property add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.frequencies add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.allowable_qualifiers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.broader_concepts add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.broader_descriptors add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.broader_qualifiers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.concepts add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.indexer_consider_also_relations add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.mapped_to_relations add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.narrower_concepts add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.pharmacological_actions add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.preferred_mapped_to_relations add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.related_concepts add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.see_also_relations add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.terms add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.tree_numbers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.descriptors add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.qualifiers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.parent_tree_numbers add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.preferred_concept add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.preferred_term add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;
alter table mesh.use_instead_relations add foreign key (mesh) references mesh.mesh_bases(id) initially deferred;