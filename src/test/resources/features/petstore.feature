#language: es
@DemoAutomationApis
Característica: Automatizacion de apis
  Como colaborador de testing
  Quiero redactar y automatizar apis
  Para obtener valores y respuestas de las solucitudes requeridas

  @PetStore @CreatePet @happyPath
  Escenario: Como usuario quiero crear una mascota
    Dado que configuro las cabeceras
      | cabeceras    | valor            |
      | Content-Type | application/json |
    Y configuro el body del servicio: "configCreatePet"
      | key           | valor     |
      | id            | 1000      |
      | name          | doggie    |
      | status        | available |
      | category.name | string    |
      | tags[0].name  | string    |
    Cuando ejecuto el api
      | dominio                     | urlbase | metodo |
      | https://petstore.swagger.io | /pet    | post   |
    Entonces valido que el codigo de respuesta sea "200"
    Y valido los siguientes resultados en el json de respuesta
      | nodo   | valor     |
      | id     | 1000      |
      | name   | doggie    |
      | status | available |

  @PetStore @CreatePet @unHappyPath
  Escenario: Como usuario quiero crear una mascota cuando se ingresa un codigo errado
    Dado que configuro las cabeceras
      | cabeceras    | valor            |
      | Content-Type | application/json |
    Y configuro el body del servicio: "configCreatePet"
      | key           | valor      |
      | id            | 1000hh     |
      | name          | editDoggie |
      | status        | available  |
      | category.name | string     |
      | tags[0].name  | string     |
    Cuando ejecuto el api
      | dominio                     | urlbase | metodo |
      | https://petstore.swagger.io | /pet    | post   |
    Entonces valido que el codigo de respuesta sea "500"
    Y valido los siguientes resultados en el json de respuesta
      | nodo    | valor     |
      | code    | 500       |
      | message | something bad happened |

  @PetStore @UpdatePet @happyPath
  Escenario: Como usuario quiero actualizar una mascota por ID
    Dado que configuro las cabeceras
      | cabeceras    | valor            |
      | Content-Type | application/json |
    Y configuro el body del servicio: "configCreatePet"
      | key           | valor      |
      | id            | 1000       |
      | name          | editDoggie |
      | status        | available  |
      | category.name | string     |
      | tags[0].name  | string     |
    Cuando ejecuto el api
      | dominio                     | urlbase | metodo |
      | https://petstore.swagger.io | /pet    | put    |
    Entonces valido que el codigo de respuesta sea "200"
    Y valido los siguientes resultados en el json de respuesta
      | nodo   | valor      |
      | id     | 1000       |
      | name   | editDoggie |
      | status | available  |

  @PetStore @UpdatePet @unHappyPath
  Escenario: Como usuario quiero actualizar una mascota cuando se ingresa un codigo errado
    Dado que configuro las cabeceras
      | cabeceras    | valor            |
      | Content-Type | application/json |
    Y configuro el body del servicio: "configCreatePet"
      | key           | valor      |
      | id            | 1000hh     |
      | name          | editDoggie |
      | status        | available  |
      | category.name | string     |
      | tags[0].name  | string     |
    Cuando ejecuto el api
      | dominio                     | urlbase | metodo |
      | https://petstore.swagger.io | /pet    | put    |
    Entonces valido que el codigo de respuesta sea "500"
    Y valido los siguientes resultados en el json de respuesta
      | nodo    | valor     |
      | code    | 500       |
      | message | something bad happened |

  @PetStore @GetPetById @happyPath
  Escenario: Como usuario quiero obtener los datos de una mascota existente filtrando por ID
    Dado que configuro las cabeceras
      | cabeceras    | valor            |
      | Content-Type | application/json |
    Cuando ejecuto el api
      | dominio                     | urlbase   | metodo |
      | https://petstore.swagger.io | /pet/1000 | get    |
    Entonces valido que el codigo de respuesta sea "200"
    Y valido los siguientes resultados en el json de respuesta
      | nodo   | valor      |
      | id     | 1000       |
      | name   | editDoggie |
      | status | available  |

