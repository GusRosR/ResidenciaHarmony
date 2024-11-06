
import router from '@ohos.router'; //Esto sirve para poder redireccionar a cada módulo cuando se da clic al botón
@Entry  // Este comando señala el punto de inicio de la aplicación
@Component  // Este otro comando, sirve para indicar que se va a definir un componente de Interfaz Gráfica
  /* Colores:
   * Color de fondo: 0d1321
   * Color de letras: f0ebd8
   * Color de botones: 3e5c76
   * */

struct PortScanner {  //Struct se utiliza en ArkTS para referirse a elementos que estrictamente tienen que ver con componentes de la interfaz gráfica  Index es básicamente el nombre que se le pone a dicho componente

  message: string = 'Escáner de Puertos'  //En este caso, message es el nombre de la variable que se utilizará, string es el tipo de dato y posteriormente su valor
  ipInputLabel: string = 'Ingrese URL o IP'
  portsInputLabel: string = 'Seleccione los puertos'
  portsInputPlaceHolder: string = 'www.ejemplo.com o 192.168.56.15'
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
        TextInput({placeholder:this.portsInputPlaceHolder})
          .width('55%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
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
            .checked(false)
            .height(25)
            .width(25)
        }
      }
      GridItem(){
        Column({space: 10}){
          Text(this.radioBtnTodos) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnTodos, group:this.radioBtnGroup})
            .checked(false)
            .height(25)
            .width(25)
        }
      }
      GridItem(){
        Column({space:10}){
          TextInput({placeholder:this.startPortPlaceHolder})
            .width('55%')
            .height(40)
            .fontSize(20)
            .fontColor(this.textColor)
          TextInput({placeholder:this.endPortPlaceHolder})
            .width('55%')
            .height(40)
            .fontSize(20)
            .fontColor(this.textColor)
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
          {value: 'Seleccione una opción'},
          {value: '1'},
          {value:'2'},
          {value:'3'},
          {value:'4'}])
          .selected(0)
          .font({size:20, weight:FontWeight.Lighter})
          .fontColor(this.textColor)
          .selectedOptionFont({ size: 20, weight: FontWeight.Medium })
          .selectedOptionFontColor(this.textColor)
          .optionFont({ size: 20, weight: FontWeight.Medium })
          .optionFontColor(this.textColor)
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
      } .columnStart(2) .columnEnd(3) .margin({left:'100%'}) .width('100%')
    }

    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
    .width('100%')
    .height('100%')
    .backgroundColor(this.backgroundColor)
  }
}