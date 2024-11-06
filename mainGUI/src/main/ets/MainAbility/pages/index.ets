
import router from '@ohos.router'; //Esto sirve para poder redireccionar a cada módulo cuando se da clic al botón
@Entry  // Este comando señala el punto de inicio de la aplicación
@Component  // Este otro comando, sirve para indicar que se va a definir un componente de Interfaz Gráfica
/* Colores:
 * Color de fondo: 0d1321
 * Color de letras: f0ebd8
 * Color de botones: 3e5c76
 * */

struct Index {  //Struct se utiliza en ArkTS para referirse a elementos que estrictamente tienen que ver con componentes de la interfaz gráfica  Index es básicamente el nombre que se le pone a dicho componente

  // Para mantener las mejores prácticas, todas las cadenas que sean estáticas se declararán aquí
  message: string = 'Escáner Seis'  //En este caso, message es el nombre de la variable que se utilizará, string es el tipo de dato y posteriormente su valor
  portScannerButtonMessage: string = 'Escanear Puertos'
  portScannerURL: string = 'pages/portScanner'
  hostDiscoverButtonMessage: string = 'Descubrir Hosts'
  hostDiscoverURL: string = 'pages/hostDiscover'
  vulnAnalizerButtonMessage: string = 'Analizar Vulnerabilidades'
  vulnAnalizerURL: string = 'pages/vulnAnalizer'
  reportGeneratorButtonMessage: string = 'Generar Reportes'
  reportGeneratorURL: string = 'pages/reportGenerator'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'
  buttonImagesBgColor: string = '#ffeddf'

  build() { //Este método se encarga de renderizar el aspecto de los componentes que se declaren dentro de el, es algo muy similar al método inizializeComponents en java window builder, se usa únicamente para UI

    Column(){    //Este método crea un contenedor en donde acomoda los elementos dentro de éste de manera vertical, lo que se meta aquí será acomodado en una sola columna
      Row(){     //Este método crea un contenedor donde se acomodan de manera horizontal todos los elementos dentre de él
        Text(this.message) //Este método muestra en pantalla el mensaje que se encuentre entre paréntesis, this.message accede al mensaje que se declaró previamente
          .fontSize(50) //Tamaño del texto
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold) //Peso del texto, negritas, aún más en negritas
      } .margin({top:'10%'}) //Margen entre el CONTENEDOR y el borde superior de la pantalla
      Grid(){ //Contenedor que cumple la función de almacenar de manera responsiva los elementos que se encuentren dentro de él

        //Botón escáner de puertos
        GridItem(){   //El grid item es básicamente la forma de declarar un elemento de la cuadrícula
          Button() { //Este método crea un botón
            Text(this.portScannerButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')  //Esto indica el espacio que hay de manera interna entre el texto y los bordes del botón
              .maxLines(2)    //Esta propiedad indica el tamaño máximo de líneas en las que se puede dividir el texto en caso de que cambie la disposición o espacio
              .lineHeight(30) //Esta propiedad indica la medida que tendrá cada línea de las que se indicó en la propiedad anterior, ajustar este parámetro a discreción
          }
          .type(ButtonType.Capsule) //Se establece el tipo de botón que se usará
          .backgroundColor(this.buttonColor)
          .height('35%')  //Indica la altura que tendrá el botón
          .onClick(()=>{  //Método que indica qué se hará cuando se le de click al botón
            router.push({ url: this.portScannerURL })  //EL .push es un método que redirecciona hacia otra página dentro del proyecto
          })
          } .height('50%')  //Esto indica la altura que tendrá EL ITEM DE LA CUADRÍCULA

        //Botón de Descubrir Hosts
        GridItem(){
          Button() { //Este método crea un botón
            Text(this.hostDiscoverButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')
              .maxLines(2)
              .lineHeight(30)
          }
          .type(ButtonType.Capsule) //Se establece el tipo de botón que se usará
          .backgroundColor(this.buttonColor)
          .height('35%')
          .onClick(()=>{
            router.push({ url: this.hostDiscoverURL })
          })
        } .height('50%')

        //Botón Analizar Vulnerabilidades
        GridItem(){
          Button() { //Este método crea un botón
            Text(this.vulnAnalizerButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')
              .maxLines(2)
              .lineHeight(30)
          }
          .type(ButtonType.Capsule) //Se establece el tipo de botón que se usará
          .backgroundColor(this.buttonColor)
          .height('35%')
          .onClick(()=>{
            router.push({ url: this.vulnAnalizerURL })
          })
        }.height('80%')

        //Botón Generar Reportes
        GridItem(){
          Button() { //Este método crea un botón
            Text(this.reportGeneratorButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')
              .maxLines(2)
              .lineHeight(30)
          }
          .type(ButtonType.Capsule) //Se establece el tipo de botón que se usará
          .backgroundColor(this.buttonColor)
          .height('35%')
          .onClick(()=>{
            router.push({ url: this.reportGeneratorURL })
          })
        } .height('50%')

        //Imágen de escaner de puertos
        GridItem(){
          Image($r('app.media.portScanner')) /*El componente Image permite insertar imágenes en el programa el $r sirve para indicar una ruta relativa, las imágenes
            que deben introducirse en la carpeta resources/base/media, una vez ahí, para referenciarlo, se debe indicar en la ruta
            a dónde pertenece el recurso, en este caso sólo se puede o app o sys, posteriormente, si es dentro de la app, se debe indicar el tipo de elemento
            en este caso, puede ser color, string o media, como es una imagen, seleccionamos media y finalmente, se debe indicar el nombre del archivo, es por eso que
            la ruta queda como app.media.portScanner, ya que es un recurso que está dentro de la app, es un archivo multimedia y su nombre es portScanner */
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')   /* Esta parte es importante, el alignment top es para que la imagen se ponga en lo alto de la celda, el height al 100
        es para que la celda ocupe toda la altura que pueda y quede cerca del botón */

        //Imagen Descubrir Hosts
        GridItem(){
          Image($r('app.media.hostAlive'))
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')

        //Imagen Analizar Vulnerabilidades
        GridItem(){
          Image($r('app.media.vulnScan'))
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')

        //Imagen Generar Reportes
        GridItem(){
          Image($r('app.media.reportGen'))
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')
      }
      .columnsTemplate('1fr 1fr 1fr 1fr') /* Aquí se definen las columnas que tendrá la cuadrícula, el 1fr indica que, en este caso, como son 4 columnas, cada columna
       ocupa 1/4 de la cuadrícula, si alguno dijera 2fr, indica que esa columna en particular va a ocupar 2/4 o la mitad de la cuadrícula */
      .rowsTemplate('1fr 1fr')  //Mismo caso que las columnas
      .width('100%')    // Aquí se indica que del componente padre (es decir, la columna principal)
      .height('80%')    // se usará el 80% de toda la altura para que queden siempre centrados tanto los botones como las imágenes
    }
    .width('100%') //Se establece que la columna ocupará por completo el ancho del componente padre, que en este caso, al no estar dentro de nada más, se trata dela pantalla
    .height('100%') //Mismo caso que con el ancho
    .backgroundColor(this.backgroundColor) //Se define el color del fondo de la aplicación
  }
}