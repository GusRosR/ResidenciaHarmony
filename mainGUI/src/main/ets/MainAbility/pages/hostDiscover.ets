
import router from '@ohos.router'; //Esto sirve para poder redireccionar a cada módulo cuando se da clic al botón
@Entry  // Este comando señala el punto de inicio de la aplicación
@Component  // Este otro comando, sirve para indicar que se va a definir un componente de Interfaz Gráfica
  /* Colores:
   * Color de fondo: 0d1321
   * Color de letras: f0ebd8
   * Color de botones: 3e5c76
   * */

struct HostDiscover {  //Struct se utiliza en ArkTS para referirse a elementos que estrictamente tienen que ver con componentes de la interfaz gráfica  Index es básicamente el nombre que se le pone a dicho componente

  titleMessage: string = 'Descubrir Hosts'  //En este caso, message es el nombre de la variable que se utilizará, string es el tipo de dato y posteriormente su valor
  homeButtonMessage: string = 'Volver al inicio'
  CIDRlbl: string = 'Ingrese CIDR'
  CIDRInputPlaceHolder: string = 'Ejemplo: 192.168.1.0/24'
  descubrirOSLbl: string = '¿Descubrir OS?'
  radioBtnSi: string = 'Si'
  radioBtnNo: string = 'No'
  radioBtnGroup: string = 'DescubrirOS'
  buttonText: string = 'Descubrir'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'

  build() { //Este método se encarga de renderizar el aspecto de los componentes que se declaren dentro de el, es algo muy similar al método inizializeComponents en java window builder, se usa únicamente para UI
    Grid() { //Este método crea un contenedor en donde acomoda los elementos dentro de éste de manera vertical, lo que se meta aquí será acomodado en una sola columna
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

      GridItem() {
        Text(this.titleMessage) //Este método muestra en pantalla el mensaje que se encuentre entre paréntesis, this.message accede al mensaje que se declaró previamente
          .fontSize(45) //Tamaño del texto
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold) //Peso del texto, negritas, aún más en negritas
          .textAlign(TextAlign.Start)
          .padding({right:'20%'})
      } .columnStart(2) .columnEnd(5) .width('100%')

      GridItem(){
        Text(this.CIDRlbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({left:'20%'})

      GridItem(){
        TextInput({placeholder:this.CIDRInputPlaceHolder})
          .width('45%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
      } .columnStart(3) .columnEnd(5) .margin({right: '20%'})

      GridItem(){
        Text(this.descubrirOSLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({left:'20%'})

      GridItem(){
        Column(){
          Text(this.radioBtnSi) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnSi, group:this.radioBtnGroup})
            .checked(false)
            .height(25)
            .width(25)
        }
      } .columnStart(3) .columnEnd(4)

      GridItem(){
        Column(){
          Text(this.radioBtnNo) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnNo, group:this.radioBtnGroup})
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem(){
        Button() { //Este método crea un botón
          Text(this.buttonText)
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
      } .columnStart(2) .columnEnd(4) .margin({left:'70%'}) .width('100%')
    }
    .width('100%') //Se establece que la columna ocupará por completo el ancho del componente padre, que en este caso, al no estar dentro de nada más, se trata dela pantalla
    .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .height('100%') //Mismo caso que con el ancho
    .backgroundColor(this.backgroundColor) //Se define el color del fondo de la aplicación
  }
}