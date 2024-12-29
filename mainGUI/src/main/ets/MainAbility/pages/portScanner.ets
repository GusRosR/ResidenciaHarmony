
import router from '@ohos.router'; //Esto sirve para poder redireccionar a cada módulo cuando se da clic al botón
import hilog from '@ohos.hilog';
@Entry  // Este comando señala el punto de inicio de la aplicación
@Component  // Este otro comando, sirve para indicar que se va a definir un componente de Interfaz Gráfica
  /* Colores:
   * Color de fondo: 0d1321
   * Color de letras: f0ebd8
   * Color de botones: 3e5c76
   * */

export struct PortScanner {  //Struct se utiliza en ArkTS para referirse a elementos que estrictamente tienen que ver con componentes de la interfaz gráfica  Index es básicamente el nombre que se le pone a dicho componente

  message: string = 'Escáner de Puertos'  //En este caso, message es el nombre de la variable que se utilizará, string es el tipo de dato y posteriormente su valor
  ipInputLabel: string = 'Ingrese URL o IP'
  portsInputLabel: string = 'Seleccione los puertos'
  objectiveInputPlaceHolder: string = 'www.ejemplo.com o 192.168.56.15'
  startPortPlaceHolder: string = 'Puerto Inicial'
  endPortPlaceHolder: string = 'Puerto Final'
  speedInputLabel: string = 'Seleccione la velocidad'
  radioBtnPopular: string = 'Puertos Populares'
  radioBtnTodos: string = 'Todos los Puertos'
  radioBtnGroup: string = 'puertos'
  homeButtonMessage: string = 'Volver'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'
  comboBoxBgColor: string = '#f4f0ed'
  scanBtnLbl: string = 'Escanear'
  cleanBtnLbl: string = 'Limpiar'

  //Títulos y mensajes de error
  tituloCaracterInvalido: string = 'Caracter inválido'
  mensajeErrorIPInvalida: string = 'Sólo se permiten caracteres, numeros, puntos y guiones'
  mensajeErrorPuertoInvalido: string = 'Sólo se permiten numeros'
  tituloObjetivoInvalido: string = 'Error, Objetivo Inválido'
  mensajeObjetivoInvalido: string = 'Se debe ingresar una direción IP o un dominio válido'
  textoPredeterminadoSelect: string = 'Seleccione una opción'
  tituloPuertoIncorrecto: string = 'Error, Puerto Inválido'
  mensajePuertoIncorrecto: string = 'El puerto inicial no puede ser mayor que el final'
  tituloPuertoFueraDeRango: string = 'Error, Puerto Fuera de Rango'
  mensajePuertoFueraDeRango: string = 'El puerto máximo a escanear es el 65,535'
  tituloSeleccionarVelocidad: string = 'Error, velocidad no seleccionada'
  mensajeSeleccionarVelocidad: string = 'Se debe seleccionar una velocidad de escaneo'


  //Expresiones regulares para verificar los caracteres que se escriben en los campos de texto
  characterIpURLRegex: string = '^[a-zA-Z0-9.\\-]+$'
  portsRegex: string = '^[0-9]*$'

  //Expresiones regulares para verificar que se haya escrito una IP o un dominio válido
  fullDomainRegex: string = '^[a-zA-Z0-9-]+(\.[a-zA-Z]+)+$'
  fullIpRegex: string = '^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'


  //Variables en las que se almacenará el valor de los campos que el usuario puede utilizar
  @State ipOURL: string = ''
  @State puertoInicial: string = ''
  @State puertoFinal: string = ''
  @State velocidadEscaneo: number = 0

  //Banderas que sirven para controlar que no se pueda seleccionar un radio boton si se están escribiendo los puertos y viceversa
  @State radioSeleccionado: boolean = false
  @State campoDeTextoSeleccionado: boolean = false

  build() { //Este método se encarga de renderizar el aspecto de los componentes que se declaren dentro de el, es algo muy similar al método inizializeComponents en java window builder, se usa únicamente para UI
    Grid(){

      //Botón de volver
      GridItem(){
        Button() { //Este método crea un botón
          Text(this.homeButtonMessage)
            .fontSize(20)
            .fontColor(this.textColor)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .padding('10%')
        }
        .type(ButtonType.Capsule) //Se establece el tipo de botón que se usará
        .backgroundColor(this.buttonColor)
        .height('40%')
        .margin(5)
        .onClick(()=>{
          router.push({ url: this.homeURL })
        })
      } .height('55%')

      //Título de la página
      GridItem() {
        Text(this.message) //Este método muestra en pantalla el mensaje que se encuentre entre paréntesis, this.message accede al mensaje que se declaró previamente
          .fontSize(45) //Tamaño del texto
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold) //Peso del texto, negritas, aún más en negritas
          .textAlign(TextAlign.Start)
          .padding({right:'30%'})
      } .columnStart(2) .columnEnd(4) .width('100%')

      GridItem(){
        Text(this.ipInputLabel)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({left: '20%'})

      GridItem(){

        /*En el caso de los campos de texto, se utiliza la propiedad text dentro de los parámetros de creación
         para acceder al contenido de lo que está escrito en este, esto es útil para el botón de limpiar
         en el que se borra el contenido escrito en todos los campos de texto*/
        TextInput({placeholder:this.objectiveInputPlaceHolder,text:this.ipOURL})
          .width('55%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
            /*El atributo inputFilter sirve para restringir los caracteres que se pueden escribir dentro de un campo de texto
           la sintaxis dentro del paréntesis es .inputFilter((caracter o expresión regular), (nombreDelError: tipoDeDato) => {acción que se hará si se teclea algún
           caracter inválido})*/
          .inputFilter((this.characterIpURLRegex),(caracterInvalido:string) => {

            /*El AlertDialog.show es un método que muestra una ventana emergente que brinda información al usuario, su sintaxis es:
             AlertDialog.show({propiedades a utilizar por ejemplo: title:'valor',message:valor y así con todas las propiedades que se requieran})*/
            AlertDialog.show({
              title: this.tituloCaracterInvalido, //Esta propiedad indica el título de la ventana emergente
              message: this.mensajeErrorIPInvalida, //Esta propiedad indica el mensaje que se mostrará en la ventana
              autoCancel:false, //Esta propiedad indica si la ventana puede cerrarse al tocar otra parte de la pantalla, sólo puede ser true o false
              alignment: DialogAlignment.Center, //Esta propiedad indica en dónde o en qué parte de la pantalla se mostrará la ventana
              confirm: {
                /*La propiedad confirm sirve para indicar lo que se hará cuando se apriete el botón adjunto en la ventana emergente, su sintaxis es:
                 confirm: { value:'Texto del botón', action: () => {acción o acciones a realizar luego de apretar el botón }, }existe la posibilidad
                 de generar una ventana con tres botones, para lograr esto, en lugar de confirm se debe escribir:
                 primaryButton: { value:'', action () => {} }, secondaryButton: { value:'', action () => {} }, cancel: () => {}*/
                value:'Volver', //Texto del botón de la ventana emergente
                action: () => {
                  return
                }
              }
            })
          })
          .onChange((valor:string)=>{ /*onChange es un método que sirve para que los campos de texto, al cambiar su contenido, es decir, cada vez que
          se escriba algo, realiza algo, su sintaxis es: .onChange((nombreDeVariable: string) => { lo que queremos que se haga })*/
            this.ipOURL = valor /*En este caso, cada vez que se escribe algo, lo que se ha escrito se guarda en la variable ipOURL, la cuál contendrá
            el texto que se escriba en el campo de texto que corresponde al objetivo del escaneo*/
          })

      } .columnStart(3) .columnEnd(4) .margin({right:'10%'})

      GridItem(){
        Text(this.portsInputLabel)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .margin({left: '20%'})

      GridItem(){
        Column({space: 10}){
          Text(this.radioBtnPopular) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnPopular, group:this.radioBtnGroup})
            /*La propiedad enabled sirve para indicar si un componente estará disponible o no para que el usuario interactúe con él.
             En este caso, su contenido es !this.campoDeTextoSeleccionado porque esta es una bandera que indica si alguno de los
             campos de texto para indicar los puertos que se van a escanear está en uso o tiene algo escrito, dado que la bandera está en false por default cuando se declara,
             es necesario negarla para que el componente esté disponible al entrar a la página, ya que la propiedad enable recibe el valor de la bandera,
             por lo cual, si esta está en falso porque ningún campo de texto está en uso, el radio botón no estaría disponible. Por este motivo es que la bandera
             debe de negarse para que funcione adecuadamente*/
            .enabled(!this.campoDeTextoSeleccionado)
            .checked(false)
            .height(25)
            .width(25)
            .onChange((isChecked:boolean)=>{ /*En este método on change, lo que se hace es que se comprueba si el radio botón está selecionado,
            si este es el caso, la bandera que indica si se ha seleccionado algún radio botón se pone en verdadero y se establece el puerto inicial y final*/
              if (isChecked) {
                this.radioSeleccionado = true
                this.puertoInicial = '1'
                this.puertoFinal = '1024'
              }
            })
        }
      }
      GridItem(){
        Column({space: 10}){
          Text(this.radioBtnTodos) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnTodos, group:this.radioBtnGroup})
            .enabled(!this.campoDeTextoSeleccionado)
            .checked(false)
            .height(25)
            .width(25)
            .onChange((isChecked:boolean)=>{ //Aquí en el método onChange se realiza la misma metodología que con el otro radio botón
              if (isChecked) {
                this.puertoInicial = '1'
                this.puertoFinal = '65535'
                this.radioSeleccionado = true
              }
            })
        }
      }
      GridItem(){
        Column({space:10}){
          TextInput({placeholder:this.startPortPlaceHolder,text:this.puertoInicial})
            .enabled(!this.radioSeleccionado) /*Se sigue el mismo concepto del campo de texto de la IP o el domimio, si un radio botón está seleccionado
            los campos de texto para señalar los puertos quedan inaccesibles*/
            .width('55%')
            .height(40)
            .fontSize(20)
            .fontColor(this.textColor)
            .inputFilter((this.portsRegex),(puertoInvalido:string) => { /*Aquí se sigue el mismo procedimiento que para el campo de texto de la IP, usando una
            expresión regular que sólo permite números*/

              //Se muestra un mensaje de error emergente como en el otro campo de texto
              AlertDialog.show({
                title: this.tituloCaracterInvalido,
                message: this.mensajeErrorPuertoInvalido,
                autoCancel:false,
                alignment: DialogAlignment.Center,
                confirm: {
                  value:'Volver',
                  action: () => {
                    return
                  }
                }
              })
            })
            .onChange((value:string)=>{
              this.campoDeTextoSeleccionado = true /*Lo primero que se hace es señalar la bandera que indica que se está escribiendo en el campo de texto para restringir
              los radio botones*/
              if (value=== '') { /*Ahora bien, esta condición revisa si el contenido del campo de texto está vacío, esto se hace para que en el caso de que se
              esté escribiendo el rango de puertos y por algún motivo ya no se requiera seleccionar un rango en particular, la bandera se ponga en falso y los radio
              botones estén disponibles nuevamente*/
                this.campoDeTextoSeleccionado = false
              }
              this.puertoInicial = value //Se guarda de manera dinámica el texto escrito en el campo de texto en la variable del puerto inicial
            })

          TextInput({placeholder:this.endPortPlaceHolder,text:this.puertoFinal})
            .enabled(!this.radioSeleccionado)
            .width('55%')
            .height(40)
            .fontSize(20)
            .fontColor(this.textColor)
            .inputFilter((this.portsRegex),(puertoFInvalido:string) => { //Mismo procedimiento que en el campo de texto anterior
              AlertDialog.show({ //Mismo caso que en el campo de texto anterior
                title: this.tituloCaracterInvalido,
                message: this.mensajeErrorPuertoInvalido,
                autoCancel:false,
                alignment: DialogAlignment.Center,
                confirm: {
                  value:'Volver',
                  action: () => {
                    return
                  }
                }
              })
            })

            .onChange((value:string)=>{  //Se realiza lo mismo que en el campo de texto anterior
              this.campoDeTextoSeleccionado = true
              if (value=== '') {
                this.campoDeTextoSeleccionado = false
              }
              this.puertoFinal = value
            })
        }
      }

      GridItem(){
        Text(this.speedInputLabel)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .margin({left:'20%'}) .columnStart(1) .columnEnd(2)

      GridItem(){
        Select([
          {value: '1 (Rápido)'},
          {value:'2 (Medio)'},
          {value:'3 (Lento)'},
          {value:'4 (Muy Lento)'}])
          .selected(0)
          .font({size:20, weight:FontWeight.Lighter})
          .fontColor(this.textColor)
          .selectedOptionFont({ size: 20, weight: FontWeight.Medium })
          .selectedOptionFontColor(this.textColor)
          .optionFont({ size: 20, weight: FontWeight.Medium })
          .optionFontColor(this.textColor)
          .onSelect((index:number)=>{
            this.velocidadEscaneo = index
            console.info('Select:' + index)

          })
      } .columnStart(3) .columnEnd(4) .margin({right:'30%'})

      GridItem(){
        Button() { //Este método crea un botón
          Text(this.scanBtnLbl)
            .fontSize(20)
            .fontColor(this.textColor)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .padding('10%')
        }
        .type(ButtonType.Capsule) //Se establece el tipo de botón que se usará
        .backgroundColor(this.buttonColor)
        .height('40%')
        .margin(5)
        .onClick(()=>{

          //Validación de que se ingrese un dominio o IP válido
          if (!(this.ipOURL.match(this.fullDomainRegex) || this.ipOURL.match(this.fullIpRegex))) {
            /*Esta condición lo que verifica es que el dominio o dirección IP ingresado sean válidos, en el caso de que se
             ingrese un dominio debe de seguir una sintaxis como la siguiente:

             - google.com
             - tepic.tecnm.mx
             - trivago.com.mx
             - nmap.org

             En el caso de que se ingrese una dirección IP, se deberá de seguir la sintaxis
             numero.numero.numero.numero y de igual manera, deberá de ser una IP que sea válida, es decir,
             que cada uno de sus números corrwsponda a la clase adecuada, por ejemplo:

             - 192.168.1.15
             - 185.12.0.0
             - 2.0.0.0*/

            //Mensaje de error que indica que la IP o dominio no es válido
            AlertDialog.show({
              title: this.tituloObjetivoInvalido,
              message: this.mensajeObjetivoInvalido,
              autoCancel:false,
              alignment: DialogAlignment.Center,
              confirm: {
                value:'Volver',
                action: () => {
                }
              }
            })

            return //Vuelve a checar la condición para validar la IP o dominio

          } else { //Si no se cumple que la IP o el dominio sea inválido, se ejecuta la siguiente validación

            //Lógica para validar que el puerto inicial siempre sea menor que el final
            if (!(parseInt(this.puertoInicial) < parseInt(this.puertoFinal))) {
              /*La condición anterior sirve para comprobar que el puerto inicial siempre sea menor al puerto final
               el método parseInt() sirve para convertir el valor de texto a número*/

              //Mensaje de error, puerto inválido
              AlertDialog.show({
                title: this.tituloPuertoIncorrecto,
                message: this.mensajePuertoIncorrecto,
                autoCancel:false,
                alignment: DialogAlignment.Center,
                confirm: {
                  value:'Volver',
                  action: () => {
                  }
                }
              })
              return //Regresa a checar la condición

            } else { //Si se cunple que el puerto inicial es menor al final, entonces ahora hace la siguiente validación

              if (!(parseInt(this.puertoFinal)> 65535)) {
                /*En esta condición se revisa que el puerto final no es mayor que el máximo de puertos que existen para escanear*/

                /* Se imprime en la consola el valor de cada una de las variables que servirán para hacer el escaneo para mantener un registro de su valor por si
                 hay que debuguear*/
                  console.info(this.ipOURL)
                  console.info(this.puertoInicial)
                  console.info(this.puertoFinal)
                  console.info(this.velocidadEscaneo.toString())

                  /*Aquí se hace uso del método router.push que se había usado previamente, la diferencia es que en esta ocasión
                   se agregará el atributo params, este atributo sirve para mandar datos desde la pestaña en la que estamos
                   hacia la pestaña que se especifica en el parámetro URL, el atributo params es un arreglo de objetos, por lo cuál
                   se puede mandar cualquier tipo de objeto a través de él para acceder a este desde otra ventana*/

                router.push({ //Método para enrutar hacia otra página
                    url: 'pages/logic/portScan', //Página o archivo al que deseamos acceder o dirigirnos
                    params: { //Datos que se enviarán hacia la URL

                      objetivo: this.ipOURL, //Es importante mencionar que todos los datos que se manden deben seguir la nomenclatura:
                      puertoI: this.puertoInicial, // nombreDeVariable: dato a enviar
                      puertoF: this.puertoFinal,
                      velocidad: this.velocidadEscaneo,
                    },
                  })
              } else { //Si no se cumple la condición de que el puerto final sea menor al máximo puerto disponible se muestra un mensaje de error

                //Mensaje de puerto fuera de rango
                AlertDialog.show({
                  title: this.tituloPuertoFueraDeRango,
                  message: this.mensajePuertoFueraDeRango,
                  autoCancel:false,
                  alignment: DialogAlignment.Center,
                  confirm: {
                    value:'Volver',
                    action: () => {
                    }
                  }
                })
              }
            }
          }
        })
      } .columnStart(1) .columnEnd(2) .width('100%')


      GridItem(){
        Button() { //Aquí se crea un botón más en caso de que se requiera limpiar la información ingresada en todos los campos
          Text(this.cleanBtnLbl)
            .fontSize(20)
            .fontColor(this.textColor)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .padding('10%')
        }
        .type(ButtonType.Capsule) //Se establece el tipo de botón que se usará
        .backgroundColor(this.buttonColor)
        .height('40%')
        .margin(5)
        .onClick(() => {

          //En esta sección dejamos en blanco el texto del campo de texto para la IP o Dominio
          this.ipOURL = ''

          /*Para optimizar la ejecución del código checamos si la bandera de que un radio botón está seleccionado
           en el caso de que sí lo esté se hace lo siguiente:*/
          if (this.radioSeleccionado) {
            this.puertoInicial = ''; //Se deja vacío el puerto inicial
            this.puertoFinal = ''; //Se deja vacío el puerto final
            this.radioSeleccionado = false; //Se resetea la bandera de que el botón está seleccionado para que los campos de texto estén disponibles
          }

          if (this.campoDeTextoSeleccionado) { //Mismo concepto que con la condición anterior
            this.puertoInicial = '' // Se deja vacío el puerto inicial
            this.puertoFinal = '' // Se deja vacío el puerto final
            this.campoDeTextoSeleccionado = false; // Se resetea la bandera del campo de texto para liberar los botones
          }

          //Se resetea la velocidad de escaneo
          this.velocidadEscaneo = 0;
          console.info('Campos limpiados')
        })
      } .columnStart(3) .columnEnd(4) .width('100%')
    }
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
    .width('100%')
    .height('100%')
    .backgroundColor(this.backgroundColor)
  }
}