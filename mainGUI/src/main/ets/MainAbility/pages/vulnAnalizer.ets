
import router from '@ohos.router'; //Esto sirve para poder redireccionar a cada módulo cuando se da clic al botón
@Entry  // Este comando señala el punto de inicio de la aplicación
@Component  // Este otro comando, sirve para indicar que se va a definir un componente de Interfaz Gráfica
  /* Colores:
   * Color de fondo: 0d1321
   * Color de letras: f0ebd8
   * Color de botones: 3e5c76
   * */

struct VulnAnalizer {  //Struct se utiliza en ArkTS para referirse a elementos que estrictamente tienen que ver con componentes de la interfaz gráfica  Index es básicamente el nombre que se le pone a dicho componente

  titleMessage: string = 'Analizar Vulnerabilidades'  //En este caso, message es el nombre de la variable que se utilizará, string es el tipo de dato y posteriormente su valor
  homeButtonMessage: string = 'Volver al inicio'
  ipInputLbl: string = 'Ingresar IP o URL'
  targetInputPlaceHolder: string = 'www.ejemplo.com o 192.168.56.15'
  tipoAnalisisLbl: string = 'Tipo de Análisis'
  mainBtnText: string = 'Analizar'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'

  build() { //Este método se encarga de renderizar el aspecto de los componentes que se declaren dentro de el, es algo muy similar al método inizializeComponents en java window builder, se usa únicamente para UI
    Grid() { //Este método crea un contenedor en donde acomoda los elementos dentro de éste de manera vertical, lo que se meta aquí será acomodado en una sola columna

      GridItem() {

        //Botón para volver al inicio
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
        .margin(2)
        .onClick(() => {
          router.push({ url: this.homeURL })
        })
      }.height('55%') .margin({right:'20%'})

      //Título de la página
      GridItem() {
        Text(this.titleMessage) //Este método muestra en pantalla el mensaje que se encuentre entre paréntesis, this.message accede al mensaje que se declaró previamente
          .fontSize(45) //Tamaño del texto
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold) //Peso del texto, negritas, aún más en negritas
          .textAlign(TextAlign.Start)
          .padding({right:'30%'})
      } .width('100%') .columnStart(2) .columnEnd(3) .margin({right:'15%'})

      //Etiqueta IP o URL
      GridItem(){
        Text(this.ipInputLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({right:'30%'})

      //Input Ip o URL

      GridItem(){
        TextInput({placeholder:this.targetInputPlaceHolder})
          .width('100%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
      } .margin({right:'30%'})

      //Etiqueta tipo de análisis
      GridItem(){
        Text(this.tipoAnalisisLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({right:'30%'})

      //Opciones tipo de análisis
      GridItem(){
        Select([
          {value: 'Seleccione una opción'},
          {value: 'Auth'},
          {value:'Default'},
          {value:'Discovery'},
          {value:'External'},
          {value: 'Intrusive'},
          {value: 'Búsqueda de Malware'},
          {value: 'Safe'},
          {value: 'Vuln'},
          {value: 'All'}])
          .selected(0)
          .font({size:20, weight:FontWeight.Lighter})
          .fontColor(this.textColor)
          .selectedOptionFont({ size: 20, weight: FontWeight.Medium })
          .selectedOptionFontColor(this.textColor)
          .optionFont({ size: 20, weight: FontWeight.Medium })
          .optionFontColor(this.textColor)
      }  .margin({right:'30%'})

      GridItem(){
        Button() { //Este método crea un botón
          Text(this.mainBtnText)
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
      } .columnStart(1) .columnEnd(3) .width('100%')

    }
    .columnsTemplate('1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .width('100%') //Se establece que la columna ocupará por completo el ancho del componente padre, que en este caso, al no estar dentro de nada más, se trata dela pantalla
    .height('100%') //Mismo caso que con el ancho
    .backgroundColor(this.backgroundColor) //Se define el color del fondo de la aplicación

  }
}