
//Se importan las librerías necesarias para que el programa funcione adecuadamente
import router from '@ohos.router'; //Esta librería sirve para obtener los datos que se envían desde la página portScanner.ets
import fetch from '@system.fetch'; //Esta librería sirve para hacer una petición de datos al internet
import socket from '@ohos.net.socket'; //Esta librería es la que permite enviar los paquetes de datos para hacer el escaneo de puertos

@Entry
@Component

struct PortScan {

  //Variables en las que se almacenan los datos que se envían desde la ventana de la GUI del escaner de puertos
  private objetivo: string = router.getParams()['objetivo']  //Para extraer los parámetros que son enviados es necesario utilizar el objeto router
  private puertoI: string = router.getParams()['puertoI']    //que se obtiene de exportar la librería router. Posteriormente, hay que utilizar el método
  private puertoF: string = router.getParams()['puertoF']   // getParams(), si sólo se pusiera router.getParams(), sería necesario utilizar una variable
  private velocidad: number = router.getParams()['velocidad'] //de tipo arreglo para almacenar todos los parámetros, ahora biem, para extraer por separado
                                                              //cada parámetro hay que poner entre corchetes luego del método getParams el nombre del parámetro que se necesita




  //Título y mensaje para el error en la IP
  private tituloErrorIP: string = 'Error al resolver IP'
  private mensajeErrorIP: string = 'Hubo un error al resolver la IP del dominio, revisar sintaxis o si el dominio está activo'

  //Ruta de la página con la GUI principal del escáner de puertos
  private rutaGUIScanner: string = 'pages/portScanner'

  //Color del texto y el fondo
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'


  @State isLoading: boolean = false; //Bandera que indica si el escaneo está en progreso
  @State ip: string = '' //Variable en la que se almacenará la IP a la que se hará el escaneo
  @State puertosAbiertos: Array<number> = []  //Arreglo variable en el que se almacenarán los puertos abiertos


  /*Método que sirve para convertir los dominios en direcciones IP, esto es necesario hacerlo porque los escaneos únicamente
   se realizan con direcciones IP a nivel de paquetes de datos. Por ello, previo a cualquier escaneo hay que resolver la IP
   en el caso de que se haya ingresado un dominio*/

  reverseURL(){
    const that = this; /* Esta constante es necesaria para retener el contexto. Dado que se estarán utilizando diversos métodos anidados en este,
    es útil retener el contexto this para que cuando se quiera mandar datos o incluso acceder a otros componentes desde uno de los métodos anidados al
    método principal o método padre, se utilice that, ya que, si se utilizara el atributo this dentro de un método anidado,
    únicamente mostrarían los elementos dentro de dicho método a los que puede tiene acceso*/

    if (/[a-zA-Z]/.test(that.objetivo)) { //Se ejecuta únicamente si se trata de un dominio

      fetch.fetch({ //Método que realiza la petición de datos

        url: `https://dns.google/resolve?name=${that.objetivo}&type=A`, /*URL a la que se realizará la petición de la información, esta URL es el resolvedor de Google
        y recupera información acerca de la página que va después de name=, entre estos datos, se encuentra su IP*/


        method: 'GET', // Protocolo que se utilizará para hacer la petición (GET/POST/DELETE)
        responseType: 'json', //Tipo de respuesta que se desea obtener XML y JSON son los más comunes
        success: function (response) { //Lo que ocurre en el caso de que la respuesta contenga un código de éxito
          try {
            let responseData; //Variable en la que se almacenará los datos de la respuesta
            if (typeof response.data === 'string') { //Se declara explícitamente que es una cadena o texto para que no marque error
              responseData = JSON.parse(response.data); //Se convierten los datos a un objeto en el caso de que se devuelva un string como respuesta
            } else {
              responseData = response.data; //Si la respuesta es un objeto, utilizarlo directamente
            }
            const ip = responseData.Answer?.[0]?.data; //Se extrae únicamente la dirección IP de la respuesta del formato JSON

            if (ip) { //Condición que verifica si fue posible obtener la IP
              console.info(ip);
             that.ip = ip; // Se guarda la dirección ip en la variable declarada previamente
            } else {
              console.warn('No se encontró la IP en la respuesta'); //En el caso de que no se haya podido obtener la IP se manda un mensaje en consola
            }
          } catch (error) {
            console.error('Error presentado:', error); //En el caso de que se sucite algín otro error, se imprime en la consola

          }
        },
        fail: function () { //Este método indica lo que ocurre cuando un método manda un estatus de error o fallido
          console.error('Petición fallida');
        },
        complete: function () { //Por otro lado, este método indica lo que ocurre si un método devuelve un mensaje de éxito
          console.info('Petición completada con éxito');
        },
      });
    } else {
      console.info('El objetivo ya es una dirección IP:', that.objetivo); // En el caso de que el objetivo o parámetro extraído sea una IP, este método no aplica
      //y únicamente imprime en consola que ya se está trabajando con una IP
    }
  }

  /* El siguiente método es en el que ocurre la magia. Este método funciona de manera asincrona. Es decir, no se ejecuta de manera lineal si no que,
   las instrucciones se ejecutan en desorden para que si una conexión tarda en responder, las demás conexiones se puedan realizar sin esperar la
   conexión que está tardando, asegurando un buen desempeño. Este método únicamente recibe un parámetro, que es el puerto al que se requiere hacer la conexión*/
  async logicaEscaneo(port) {

    const endPort = parseInt(this.puertoF); //Se convierte el texto del puerto final a número para compararlo

      this.isLoading = true //Se pone la bandera de que se está ejecutando un escaneo en verdadero
      let tcpSocket = socket.constructTCPSocketInstance(); /* Se crea una instancia del socket tcp. Este socket nos permite acceder
      a los diversos métodos que contenidos en la librería socket */
      let bindPromise = tcpSocket.bind({address: '0.0.0.0', port: 0, family: 1}); /* Previo a realizar una conexión TCP a la ip objetivo, primero se debe
      hacer un bind, esto básicamente lo que hace es indicar en qué dirección ip (localmente hablando) se van a recibir los datos, el método bind es un
      arreglo que como mínimo requiere tres parámetros, address, que indica la ip en la que se recibirá la información, port, indcando el puerto y family,
      en el caso de este último, indica si se trata de IPV4 o IPV6, el 1 indica que se trata de IPV4. Por último, como se observa, se está utilizando una
      variable llamada bindPromise, el método bind se ejecuta de manera asíncrona por lo que utiliza una promesa, la cuál en pocas palabras es la confirmación
      del método de que ya ha concluido su ejecución, esta promesa es necesaria para declarar las acciones siguientes a ejecutar una vez que se tenga
      la respuesta */
      bindPromise.then(() => { //Se indica que una vez que se tenga la respuesta de la promesa, el programa continúe
        console.info('Bind exitoso') //Se imprime en la consola que el bind fue exitoso
        let connectPromise = tcpSocket.connect({ address: {address: this.ip, port:port, family: 1} , timeout: this.velocidad*2500});
        /* El método connect de la librería socket también se ejecuta de manera asíncrona por lo que hay que usar una promesa como en el bind.
          El método connect recibe un arreglo con dos parámetros, un arreglo con las características para conectarse y un tiempo de vida para hacer la conexión
          .connect({address:{address:ip objetivo, port: puerto desde el que nos deseamos conectar, family: version de protocolo de internet}},
          timeout: tiempo de vida de la conexión}) En este método es en el que se lleva a cabo el "escaneo" de puertos ya que, al intentar hacer una conexión,
          cuando la conexión es exitosa, se da por entendido que el puerto está escuchando conexiones y por ende, está abierto. */
        connectPromise.then(()=>{ //Se espera la respuesta de la promesa
          console.info('Conexión exitosa'); //Se imprime en la consola la confirmación de que la conexión fue exitosa
          this.puertosAbiertos.push(port) //Si el puerto permitió la conexión, se agrega al arreglo de puertos abiertos
          if (port === endPort) {  //Se verifica si el puerto que se está escaneando es igual al puerto final
            this.isLoading = false //Si es igual entonces se pone la bandera del escaneo en proceso en falso
          }
        }).catch(err2 =>{ //Este catch corresponde al error que se arroja cuando la conexión es rechazada
          console.error('Conexión rechazada'); //Se imprime en pantalla que la conexión fue rechazada
          if (port === endPort) { //Se valida si el puerto escaneado es igual al final
            this.isLoading = false //Se pone la bandera de cargando en falso
          }
        })
      }) .catch(bindError => { //Este catch corresponde al error que se muestra cuando el bind falla
        console.error('Error en el bind') //Se imprime el error en la consola
      })
      console.info('Escaneo completo') //Se imprime en consola el mensaje de que el escaneo se ha completado
  }


  async escanearPuertos(){ /*Dado que el método logicaEscaneo sólo escanea un puerto, este método sirve para llamar dicho método la cantidad de veces necesarias
  dependiendo del puerto inicial y el puerto final*/
    let puertoInicial = parseInt(this.puertoI); //Se convierten a número los valores de texto del puerto
    const puertoFinal = parseInt(this.puertoF); // inicial y el puerto final
    for (let port = puertoInicial; port <= puertoFinal; port++) { /* Este ciclo for sirve para iterar por la cantidad de puertos que hay que escanear*/
      await this.logicaEscaneo.call(this, port); /* El await sirve para esperar un tiempo antes de llamar el método logicaEscaneo, la función call
       sirve para invocar un método, recibe un parámetro, que es el método padre desde el que se va a invocar el método a llamar, en este caso se
       declara con this, y port es el parámetro que recibe el método logicaEscaneo para funcionar*/
    }
  }


 onPageShow(){ //Este método ejecuta lo que se encuentre adentro de él cuando la página se abre
   this.reverseURL() //Se llama el método de convertir dominio a IP
   setTimeout(()=>{ //Este método indica una cantidad de tiempo que se debe esperar para ejecutar lo que se encuentre dentro de él
     if (this.ip) { //Se verifica que exista la IP
       console.info('La IP ha sido resuelta') //Se muestra en la consola que la IP se ha resuelto
       this.escanearPuertos() //Se llama al método con el ciclo for, el cual a su vez llama al método que escanea puerto por puerto
     }
     else { //Si la ip no se ha podido resolver por algún motivo, se ejecuta lo siguiente

       AlertDialog.show({ //Se despliega un mensaje de error indicando que hubo un error al resolver la IP
         title: this.tituloErrorIP,
         message: this.mensajeErrorIP,
         autoCancel:false,
         alignment: DialogAlignment.Center,
         confirm: {
           value:'Volver',
           action: () => {
             router.push({ url: this.rutaGUIScanner }) //Al dar clic en el botón del mensaje emergente se regresa a la página de la GUI del escáner de puertos
           }
         }
       })
       console.error('La IP no se pudo resolver, el escaneo de puertos no será realizado')
     }
   },1000) //Se establece una espera de 1 segundo para ejecutar el código dentro de este método

 }

  //A partir de esta sección se muestran los componentes de interfaz gráfica para desplegar la información del escaneo
  build() {
    Column() {
         Text(`Objetivo: ${this.objetivo}`) /*A diferencia de lo que se había hecho antes es que para desplegar una
         variable en la interfaz gráfica se debe utilizar el símbolo `, de esta manera, al escribir ${this.variable},
         esta será mostrada en la interfaz*/
           .fontSize(20)
           .margin(10)
           .fontColor(this.textColor)

         if (/[a-zA-Z]/.test(this.objetivo)) { /*Aquí se revisa si el objetivo contiene letras en él, si es el caso, es necesario mostrar
        su dirección IP, si el objetivo no contiene letras es porque se trata de una IP y por lo tanto, no debe mostrarse esta etiqueta ya que
        sería redundante*/
           Text(`Dirección IP: ${this.ip}`)
             .fontSize(20)
             .margin(10)
             .fontColor(this.textColor)
         }

         Text(`Puerto Inicial: ${this.puertoI}`)
           .fontSize(20)
           .margin(10)
           .fontColor(this.textColor)

         Text(`Puerto Final: ${this.puertoF}`)
           .fontSize(20)
           .margin(10)
           .fontColor(this.textColor)

         Text(`Velocidad: ${this.velocidad}`)
           .fontSize(20)
           .margin(10)
           .fontColor(this.backgroundColor)

        if (this.isLoading){ /*En esta condición checamos si la bandera de escaneo en progreso está encendida, en el caso de que
        esté en verdadero, se realiza lo siguiente*/
          LoadingProgress() //Este componente muestra una animación de carga
            .color(this.textColor) //Aquí se determina el color del símbolo de animación
            .width('20%')
            .margin({bottom:'60%'})
        }
        else if (!this.isLoading && this.puertosAbiertos.length > 0){ /* En esta condición se checa si
         la bandera de carga está en falso y si el arreglo con los puertos abiertos contiene algo*/
          Text(`Puertos abiertos: ${[...this.puertosAbiertos].sort((a, b) => a - b).join(', ')}`) /* En el caso del arreglo de
           puertos abiertos debemos recordar que es muy probable que se encuentren en desorden por la naturaleza asíncrona
           del método logicaEscaneo y escanearPuertos. Por ello, es necesario ordenar el arreglo en orden ascendente para
           hacer que el usuario tenga una mejor experiencia al utilizar el programa. Los tres puntos previo al this.puertosAbiertos
           sirven para crear una copia del arreglo luego de su ejecución, esto es para que el arreglo original no se modifique
           y sólo se ordene a nivel de presentación o estética. El método sort es aquel que realiza el ordenamiento del arreglo.
           Este método recibe dos parámetros, el primero son los dos números representados de manera algebraica, que en este
           caso son a y b, pero pueden ser cualquier otras letras. Luego del =>, se muestra la regla que se seguirá para comparar.
           En este caso a - b indica que se debe ordenar de manera ascendente */
            .fontSize(20)
            .margin(5)
            .fontColor(this.textColor)

          Text(`Escaneo Completo`)
            .fontSize(20)
            .margin(10)
            .fontColor(this.textColor)
        }
    }
    .height('100%')
    .width('100%')
    .backgroundColor(this.backgroundColor)
  }
}
