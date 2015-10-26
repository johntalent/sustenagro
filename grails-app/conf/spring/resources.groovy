import rdfUtils.RDFSlurper
import dsl.DSL

// Place your Spring DSL code here
beans = {
    slp(RDFSlurper, 'http://10.62.9.236:9999/bigdata/namespace/kb/sparql')       //http://java.icmc.usp.br:9999/bigdata/namespace/kb/sparql
    dsl(DSL, 'dsl/dsl.groovy')
}

// "/bigdata/namespace/kb/sparql"
// "/bigdata/namespace/kb/sparql"
