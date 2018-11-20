package cz.iocb.pubchem.load;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Arrays;
import org.apache.jena.graph.Node;
import cz.iocb.pubchem.load.Ontology.Identifier;
import cz.iocb.pubchem.load.common.Loader;
import cz.iocb.pubchem.load.common.StreamTableLoader;



public class Reference extends Loader
{
    private static void loadTypes(String file) throws IOException, SQLException
    {
        InputStream stream = getStream(file);

        new StreamTableLoader(stream, "insert into reference_bases(id, type_id) values (?,?)")
        {
            @Override
            public void insert(Node subject, Node predicate, Node object) throws SQLException, IOException
            {
                if(!predicate.getURI().equals("http://www.w3.org/1999/02/22-rdf-syntax-ns#type"))
                    throw new IOException();

                Identifier type = Ontology.getId(object.getURI());

                if(type.unit != Ontology.unitUncategorized)
                    throw new IOException();

                setValue(1, getIntID(subject, "http://rdf.ncbi.nlm.nih.gov/pubchem/reference/PMID"));
                setValue(2, type.id);
            }
        }.load();
    }


    private static void loadDates(String file) throws IOException, SQLException
    {
        InputStream stream = getStream(file);

        new StreamTableLoader(stream, "update reference_bases set dcdate=cast(? as date) where id=?")
        {
            @Override
            public void insert(Node subject, Node predicate, Node object) throws SQLException, IOException
            {
                if(!predicate.getURI().equals("http://purl.org/dc/terms/date"))
                    throw new IOException();

                setValue(1, getString(object).replaceAll("[-+][0-9][0-9]:[0-9][0-9]$", ""));
                setValue(2, getIntID(subject, "http://rdf.ncbi.nlm.nih.gov/pubchem/reference/PMID"));
            }
        }.load();
    }


    private static void loadCitations(String file) throws IOException, SQLException
    {
        InputStream stream = getStream(file);

        new StreamTableLoader(stream, "update reference_bases set citation=? where id=?")
        {
            @Override
            public void insert(Node subject, Node predicate, Node object) throws SQLException, IOException
            {
                if(!predicate.getURI().equals("http://purl.org/dc/terms/bibliographicCitation"))
                    throw new IOException();

                setValue(1, getString(object));
                setValue(2, getIntID(subject, "http://rdf.ncbi.nlm.nih.gov/pubchem/reference/PMID"));
            }
        }.load();
    }


    private static void loadTitles(String file) throws IOException, SQLException
    {
        InputStream stream = getStream(file);

        new StreamTableLoader(stream, "update reference_bases set title=? where id=?")
        {
            @Override
            public void insert(Node subject, Node predicate, Node object) throws SQLException, IOException
            {
                if(!predicate.getURI().equals("http://purl.org/dc/terms/title"))
                    throw new IOException();

                setValue(1, getString(object));
                setValue(2, getIntID(subject, "http://rdf.ncbi.nlm.nih.gov/pubchem/reference/PMID"));
            }
        }.load();
    }


    private static void loadChemicalDiseases(String file) throws IOException, SQLException
    {
        InputStream stream = getStream(file);

        new StreamTableLoader(stream, "insert into reference_discusses(reference, statement) values (?,?)")
        {
            @Override
            public void insert(Node subject, Node predicate, Node object) throws SQLException, IOException
            {
                if(!predicate.getURI().equals("http://purl.org/spar/cito/discusses"))
                    throw new IOException();

                setValue(1, getIntID(subject, "http://rdf.ncbi.nlm.nih.gov/pubchem/reference/PMID"));

                if(object.getURI().length() > 27 && object.getURI().charAt(27) == 'M')
                    setValue(2, getIntID(object, "http://id.nlm.nih.gov/mesh/M"));
                else
                    setValue(2, -getIntID(object, "http://id.nlm.nih.gov/mesh/C"));
            }
        }.load();
    }


    private static void loadMeshheadings(String file) throws IOException, SQLException
    {
        InputStream stream = getStream(file);

        new StreamTableLoader(stream,
                "insert into reference_subject_descriptors(reference, descriptor, qualifier) values (?,?,?)")
        {
            @Override
            public void insert(Node subject, Node predicate, Node object) throws SQLException, IOException
            {
                if(!predicate.getURI().equals("http://purl.org/spar/fabio/hasSubjectTerm"))
                    throw new IOException();

                setValue(1, getIntID(subject, "http://rdf.ncbi.nlm.nih.gov/pubchem/reference/PMID"));

                String value = getStringID(object, "http://id.nlm.nih.gov/mesh/D");
                int idx = value.indexOf('Q');

                if(idx == -1)
                {
                    setValue(2, Integer.parseInt(value));
                    setValue(3, -1);
                }
                else
                {
                    setValue(2, Integer.parseInt(value.substring(0, idx)));
                    setValue(3, Integer.parseInt(value.substring(idx + 1)));
                }
            }
        }.load();
    }


    public static void loadDirectory(String path) throws IOException, SQLException
    {
        loadTypes(path + File.separatorChar + "pc_reference_type.ttl.gz");

        File dir = new File(getPubchemDirectory() + path);

        Arrays.asList(dir.listFiles()).stream().map(f -> f.getName()).forEach(name -> {
            try
            {
                if(name.startsWith("pc_reference_citation"))
                    loadCitations(path + File.separatorChar + name);
                else if(name.startsWith("pc_reference_date"))
                    loadDates(path + File.separatorChar + name);
                else if(name.startsWith("pc_reference_title"))
                    loadTitles(path + File.separatorChar + name);
                else if(name.startsWith("pc_reference2chemical_disease"))
                    loadChemicalDiseases(path + File.separatorChar + name);
                else if(name.startsWith("pc_reference2meshheading"))
                    loadMeshheadings(path + File.separatorChar + name);
                else if(!name.startsWith("pc_reference_type"))
                    System.out.println("unsupported " + path + File.separatorChar + name);
            }
            catch(IOException | SQLException e)
            {
                System.err.println("exception for " + name);
                e.printStackTrace();
                System.exit(1);
            }
        });
    }


    public static void main(String[] args) throws IOException, SQLException, ParseException
    {
        loadDirectory("RDF/reference");
    }
}
