package dsl

import com.github.rjeschke.txtmark.Processor
import org.codehaus.groovy.control.CompilerConfiguration
import org.pegdown.PegDownProcessor

/**
 * Created by dilvan on 7/14/15.
 */
class DSL {
    def name = ''
    def description = ''
    def featureLst = []
    def dimensions = []

    DSL(String file){
        // Create CompilerConfiguration and assign
        // the DelegatingScript class as the base script class.
        def compilerConfiguration = new CompilerConfiguration()
        compilerConfiguration.scriptBaseClass = DelegatingScript.class.name

        // Configure the GroovyShell and pass the compiler configuration.
        def shell = new GroovyShell(this.class.classLoader, new Binding(), compilerConfiguration)

        def script = shell.parse(new File(file).text)
        script.setDelegate(this)

        // Run DSL script.
        script.run()

        println featureLst

    }

    def name(String nameStr){
        name = nameStr
        println name
    }

    def description(String nameStr){
        description = nameStr
        //println  Processor.process(description, true)
        println new PegDownProcessor().markdownToHtml(description)
    }

    def features(Closure closure){
        featureLst = []
        closure.run()
    }

    def instance(String str){
        featureLst << ['a', str]
    }

    def subclass(String str){
        featureLst << ['rdfs:subClassOf', str]
    }

    def dimension(String cls) {
        dimensions << cls
    }
}