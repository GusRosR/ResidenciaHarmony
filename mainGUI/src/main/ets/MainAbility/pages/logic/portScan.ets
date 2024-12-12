
import router from '@ohos.router';
import fetch from '@system.fetch';
import socket from '@ohos.net.socket';

@Entry
@Component


struct PortScan {

  private objetivo: string = router.getParams()['objetivo']
  private puertoI: string = router.getParams()['puertoI']
  private puertoF: string = router.getParams()['puertoF']
  private velocidad: number = router.getParams()['velocidad']
  private tituloErrorIP: string = 'Error al resolver IP'
  private mensajeErrorIP: string = 'Hubo un error al resolver la IP del dominio, revisar sintaxis o si el dominio está activo'
  private rutaGUIScanner: string = 'pages/portScanner'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  @State isLoading: boolean = false;
  @State ip: string = ''
  @State puertosAbiertos: Array<number> = []


  //Método que sirve para convertir las URL en direcciones IP
  reverseURL(){
    const that = this; // Retain the context
    if (/[a-zA-Z]/.test(that.objetivo)) { //Se ejecuta únicamente si se trata de una URL
      fetch.fetch({ //Método que realiza la petición de datos
        url: `https://dns.google/resolve?name=${that.objetivo}&type=A`, //URL a la que se realizará la petición de la información
        method: 'GET', // Protocolo que se utilizará para hacer la petición (GET/POST/DELETE)
        responseType: 'json', //Tipo de respuesta que se desea obtener
        success: function (response) { //Lo que ocurre en el caso de que la respuesta contenga un código de éxito
          try {
            let responseData; //Variable en la que se almacenará los datos de la respuesta
            if (typeof response.data === 'string') { //Se declara explícitamente que es una cadena o texto para que no marque error
              responseData = JSON.parse(response.data); //Se convierten los datos a un objeto en el caso de que se devuelva un string como respuesta
            } else {
              responseData = response.data; //Si la respuesta es un objeto, utilizarlo directamente
            }
            const ip = responseData.Answer?.[0]?.data; //Se extrae únicamente la dirección IP de la respuesta del formato JSON
            if (ip) {
              console.info(ip);
             that.ip = ip; // Se guarda la dirección ip en la variable declarada previamente
            } else {
              console.warn('IP address not found in response.');
            }
          } catch (error) {
            console.error('Error handling response data:', error);
          } finally {
            //that.isLoading = false;
          }
        },
        fail: function () {
          console.error('Fetch failed');
          //that.isLoading = false;
        },
        complete: function () {
          console.info('Fetch complete');
        },
      });
    } else {
      console.info('El objetivo ya es una dirección IP:', that.objetivo);
    }
  }


  async logicaEscaneo(port) {
    this.puertosAbiertos = []; //Reseteamos el arreglo de puertos abiertos
    let startPort = parseInt(this.puertoI); //Se convierte a número el puerto inicial y final
    const endPort = parseInt(this.puertoF);
    if (startPort<endPort) {
      this.isLoading = true
      let tcpSocket = socket.constructTCPSocketInstance(); //Se crea una instancia del socket tcp para manipular dicho socket
      let bindPromise = tcpSocket.bind({address: '0.0.0.0', port: 0, family: 1});
      bindPromise.then(() => {
        console.info('Bind exitoso')
        let connectPromise = tcpSocket.connect({ address: {address: this.ip, port:port, family: 1} , timeout: this.velocidad*2500});
        connectPromise.then(()=>{
          console.info('Conexión exitosa');
          this.puertosAbiertos.push(port)
          if (port === endPort) {
            this.isLoading = false
          }
        }).catch(err2 =>{
          console.error('Conexión rechazada');
          if (port === endPort) {
            this.isLoading = false
          }
        })
        this.puertosAbiertos.sort((a, b) => a - b)
      }) .catch(bindError => {
        console.error('Error en el bind')
      })
      startPort++
    } else {
      console.info('Escaneo Completo')
    }
  }


  async escanearPuertos(){
    let puertoInicial = parseInt(this.puertoI);
    const puertoFinal = parseInt(this.puertoF);
    for (let port = puertoInicial; port <= puertoFinal; port++) {
      await this.logicaEscaneo.call(this, port);
    }

  }

  //Este método ejecuta lo que se encuentre adentro cuando la página se abre
 onPageShow(){
   this.reverseURL() //Se llama el método de convertir URL a IP
   setTimeout(()=>{
     if (this.ip) {
       console.info('La IP ha sido resuelta')
       this.escanearPuertos()
     } 
     else {
       AlertDialog.show({
         title: this.tituloErrorIP,
         message: this.mensajeErrorIP,
         autoCancel:false,
         alignment: DialogAlignment.Center,
         confirm: {
           value:'Volver',
           action: () => {
             router.push({ url: this.rutaGUIScanner })
           }
         }
       })
       console.error('La IP no se pudo resolver, el escaneo de puertos no será realizado')
     }
   },1000)

 }


  build() {
    Column() {
         Text(`Objetivo: ${this.objetivo}`)
           .fontSize(20)
           .margin(10)
           .fontColor(this.textColor)

         if (/[a-zA-Z]/.test(this.objetivo)) {
           Text(`Dirección IP: ${this.ip}`)
             .fontSize(20)
             .margin(10)
             .fontColor(this.textColor)
         }
         //Text(`Objetivo: ${this.objetivo}`)
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

        if (this.isLoading){
          LoadingProgress()
            .color(this.textColor)
            .width('20%')
            .margin({bottom:'60%'})
        }
        else if (!this.isLoading){



          Text(`Puertos abiertos: ${[...this.puertosAbiertos].sort((a, b) => a - b).join(', ')}`)
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
