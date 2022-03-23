package bdd.api;

import cucumber.api.DataTable;
import cucumber.api.Scenario;
import cucumber.api.java.Before;
import cucumber.api.java.es.Cuando;
import cucumber.api.java.es.Dado;
import cucumber.api.java.es.Entonces;
import bdd.api.RunApiStep;
import cucumber.api.java.es.Y;
import net.thucydides.core.annotations.Steps;
import org.junit.Assert;

import java.io.IOException;

public class RunApiStepDefinition {

    private Scenario scenario;

    @Before
    public void before(Scenario scenario) {
        this.scenario = scenario;
    }

    @Steps
    private RunApiStep execApiStep;

    @Dado("^que configuro las cabeceras$")
    public void queConfiguroLasCabeceras(DataTable dataTable) {
        execApiStep.setConfigHeaders(dataTable);
    }

    @Y("^configuro el body del servicio: \"([^\"]*)\"$")
    public void configuroElBodyDelServicio(String servicio, DataTable dataTable) {
        execApiStep.setConfigBodyService(servicio, dataTable);
    }

    @Cuando("^ejecuto el api$")
    public void ejecuto_el_api(DataTable dataTable) {
        execApiStep.executeServiceAPI(dataTable);
    }

    @Entonces("^valido que el codigo de respuesta sea \"([^\"]*)\"$")
    public void valido_que_el_codigo_de_respuesta_sea(String statusCode) {
        Assert.assertTrue("El codigo de respuesta, no es el correcto.", execApiStep.validateStatusCode(Integer.parseInt(statusCode)));
    }

    @Y("^valido los siguientes resultados en el json de respuesta$")
    public void validoLosSiguientesResultadosEnElJsonDeRespuesta(DataTable dataTable) throws IOException {
        execApiStep.validateResponseBody(dataTable);
    }

}
