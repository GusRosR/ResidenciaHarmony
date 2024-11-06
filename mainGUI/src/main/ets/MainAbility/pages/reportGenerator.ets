
import router from '@ohos.router'; //Esto sirve para poder redireccionar a cada módulo cuando se da clic al botón
import document from '@ohos.document';
import fileio from '@ohos.fileio';
@Entry  // Este comando señala el punto de inicio de la aplicación
@Component  // Este otro comando, sirve para indicar que se va a definir un componente de Interfaz Gráfica
  /* Colores:
   * Color de fondo: 0d1321
   * Color de letras: f0ebd8
   * Color de botones: 3e5c76
   * */

struct ReportGenerator { //Struct se utiliza en ArkTS para referirse a elementos que estrictamente tienen que ver con componentes de la interfaz gráfica  Index es básicamente el nombre que se le pone a dicho componente

  selectFile() {
    let types = []; // Empty types array could allow directory selection, depending on system behavior
    document.choose(types).then((uri) => {
      // Validate that the selected path is a directory
      if (this.isDirectory(uri)) {
        this.saveLocationBtnText = "Directory selected: " + uri; // Update button text with directory
        console.info("Selected directory:", uri);
      } else {
        console.error("Selected item is not a directory. Please select a directory.");
        this.saveLocationBtnText = "Please select a directory";
      }
    }).catch((err) => {
      console.error("Error selecting directory:", err);
    });
  }

  // Mock directory validation function (replace with actual implementation if needed)
  isDirectory(uri: string): boolean {
    // Implement logic to verify if `uri` is a directory path
    // This could involve filesystem checks or pattern matching
    return uri.endsWith("/"); // Example: simple check if path ends with '/' (works on Unix-based systems)
  }
  titleMessage: string = 'Generar Reportes' //En este caso, message es el nombre de la variable que se utilizará, string es el tipo de dato y posteriormente su valor
  homeButtonMessage: string = 'Volver al inicio'
  radioBtnLbl: string = 'Seleccione el formato'
  radioBtnPdf: string = 'PDF'
  radioBtnWord: string = 'Word'
  radioBtnCSV: string = 'CSV'
  radioBtnGroup: string = 'documentFormat'
  saveLocationLbl: string = 'Seleccione ubicación'
  saveLocationBtnText: string = 'Guardar en...'
  mainBtnText: string = 'Generar'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'

  build() { //Este método se encarga de renderizar el aspecto de los componentes que se declaren dentro de el, es algo muy similar al método inizializeComponents en java window builder, se usa únicamente para UI
    Grid() { //Este método crea un contenedor en donde acomoda los elementos dentro de éste de manera vertical, lo que se meta aquí será acomodado en una sola columna
      //Botón de volver
      GridItem() {
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
        .onClick(() => {
          router.push({ url: this.homeURL })
        })
      }.height('55%')

      GridItem() {
        Text(this.titleMessage) //Este método muestra en pantalla el mensaje que se encuentre entre paréntesis, this.message accede al mensaje que se declaró previamente
          .fontSize(45) //Tamaño del texto
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold) //Peso del texto, negritas, aún más en negritas
          .textAlign(TextAlign.Start)
          .padding({ right: '20%' })
      }.columnStart(2).columnEnd(4).width('100%')

      GridItem() {
        Text(this.radioBtnLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      }.margin({ left: '20%' })

      GridItem() {
        Column() {
          Text(this.radioBtnPdf).fontColor(this.textColor).fontSize(15).fontWeight(FontWeight.Bold)
          Radio({ value: this.radioBtnPdf, group: this.radioBtnGroup })
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem() {
        Column() {
          Text(this.radioBtnWord).fontColor(this.textColor).fontSize(15).fontWeight(FontWeight.Bold)
          Radio({ value: this.radioBtnWord, group: this.radioBtnGroup })
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem() {
        Column() {
          Text(this.radioBtnCSV).fontColor(this.textColor).fontSize(15).fontWeight(FontWeight.Bold)
          Radio({ value: this.radioBtnCSV, group: this.radioBtnGroup })
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem() {
        Text(this.saveLocationLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      }.margin({ left: '20%' })

      GridItem() {
        Button() { //Este método crea un botón
          Text(this.saveLocationBtnText)
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
        .onClick(this.selectFile)
      } .columnStart(2) .columnEnd(4)

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
      } .columnStart(2) .columnEnd(3) .width('100%') .margin({left:'100%'})

    }
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .width('100%') //Se establece que la columna ocupará por completo el ancho del componente padre, que en este caso, al no estar dentro de nada más, se trata dela pantalla
    .height('100%') //Mismo caso que con el ancho
    .backgroundColor(this.backgroundColor) //Se define el color del fondo de la aplicación
  }
}