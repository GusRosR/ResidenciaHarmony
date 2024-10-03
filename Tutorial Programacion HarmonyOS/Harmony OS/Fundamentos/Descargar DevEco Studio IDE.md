
## ¿Qué es?

De manera resumida, DevEco Studio es un entorno de desarrollo impulsado por Intellij y está orientado a ser utilizado para el desarrollo en Harmony OS

## ¿Dónde lo descargo?

Originalmente, para descargar este IDE, el link oficial de descarga se encuentra [aquí](https://developer.huawei.com/consumer/cn/download/), no obstante, el link a la fecha (12 de agosto de 2024) se encuentra caído para cualquiera de los sistemas operativos mostrados en la página. Por esta situación, el link de descarga del IDE se encuentra [aquí](https://winstall.app/apps/Huawei.DevEco), la instalación es por medio de la línea de comandos en Windows.

## ¿Cómo lo configuro?

Una vez que ha sido instalado el DevEco Studio, se pueden realizar las siguientes configuraciones opcionales en el caso de que las necesidades de desarrollo así lo indiquen:

- Establecer un [[Gradle]] [[Proxy]]
	- Para realizar esta configuración es necesario abrir el explorador de archivos, posteriormente, ubicar el apartado de "Este Equipo" y una vez dentro de ese apartado escribir en la barra de búsqueda \%userprofile%.
	- Posteriormente, abrir el folder .gradle, crear un archivo gradle y cambiar la extensión del archivo por .properties.
	- Finalmente, agregar lo siguiente en el archivo gradle.properties y guardar el archivo, modificando por su puesto los valores acorde a los datos reales que se requieran, en el caso de nonProxyHosts, cada uno de los valores debe separarse con una barra vertical (|):
	
			systemProp.http.proxyHost=proxy.server.com
			systemProp.http.proxyPort=8080
			systemProp.http.nonProxyHosts=*.company.com/10.*/100.*
			systemProp.http.proxyUser=user/d
			systemProp.http.proxyPassword=password
			system Prop.https.proxyHost=proxy.server.com
			system Prop.https.proxyPort=8080
			systemProp.https.nonProxyHosts=*.company.com/10. */IOO. *
			systemProp.https.proxyUser=userId
			systemProp.https.proxyPassword=password
			
Establecer un proxy para el IDE
	- Iniciar el DevEco Studio. En la página desplegada de Establecer Proxy HTTP, seleccionar configuración manual de proxy y realizar la configuración.
	- Parámetros HTTP: En caso de no estar seguro de la información, contactar a su administrador de red.
		- Host name: Escribir el nombre del host o bien la dirección IP del servidor proxy.
		- Número de puerto: Escribir el número de puerto en el que corre o funciona el servidor proxy.
		- No proxy para: Escribir las URLs o direcciones IP en las que la computadora puede conectarse directamente sin un servidor proxy. Se debe utilizar comas para separar dichas direcciones IP o URLs.
	- Parámetros de autenticación del proxy: Establecer estos parámetros únicamente cuando el servidor proxy requiera de autenticación:
		- Login: Escribir el nombre de usuario utilizado para acceder al servidor proxy.
		- Password o contraseña: Escribir la contraseña usada para acceder al servidor proxy.
		- Remember o recordar: Seleccionar esta opción para recordar la contraseña y agilizar la autenticación.

Luego de establecer las configuraciones, se puede probar la conexión dando clic en Check Connection o Checar conexión, posteriormente introducir una URL para comprobar que la conectividad de red es correcta. Si se despliega el mensaje "Conexión Exitosa o Connection Successful" entonces es un indicador de que el proxy se estableció adecuadamente. 
	
- Establecer un proxy [[npm]]
	- Todas las configuraciones que se realicen en el asistente de configuración serán escritas en el archivo .npmrc en el directorio users/nombre del usuario.
	- Registro npm: Establecer la dirección del registro npm.
	- Proxy HTTP: Información del servidor proxy. Por defecto, el valor es el mismo que el proxy http de DevEco Studio.
	- Activar Proxy HTTPS: Indica si se quiere configurar un proxy https.

Al terminar estas configuraciones y dar clic en Empezar a Utilizar DevEco Studio podría darse el caso de que el servidor proxy que se utiliza requiera de nombre de usuario y contraseña para autenticación, en ese caso, se debe configurar dicha información de la siguiente manera, en caso contrario, saltar dicho paso y seguir el asistente para descargar el SDK de HarmonyOS.
Una vez hechas las configuraciones necesarias, es necesario descargar e instalar el SDK de HarmonyOS.

### Configuración de usuario y contraseña para el servidor npm

- Dirigirse al directorio de Users y abrir el archivo .npmrc
- Modificar la información del proxy npm. Añadir los campos de usuario y contraseña para proxy y https-proxy. Evidentemente los valores deben ser los que se requieran.
	- Ejemplo:
			proxy=\http://user:password@proxy.server.com:80
			https-proxy=\http://user:password@proxy.server.com:80
- Una vez configurado el proxy, abrir una línea de comandos y escribir el siguiente comando para verificar que la red está funcionando con normalidad:

		npm info express

- Si la información que se despliega después de ejecutar el comando muestra palabras clave, integridad, dependencias, entre otros, significa que el proxy ha sido establecido con éxito.

### Descarga del SDK de HarmonyOS

Si es la primera vez que se utiliza DevEco Studio, seleccionar la opción "**Do not import settings** o No importar configuraciones" y dar clic en Ok. posteriormente, seguir las instrucciones del asistente para establecer el registro npm. Este IDE se ha preconfigurado con el registro correspondiente, dar clic en Start using DevEco Studio o Empezar a usar DevEco Studio.

Siguiendo el asistente de configuración, se nos guiará para instalar el SDK en el directorio o carpeta Users o Usuarios, es posible especificar una ubicación diferente, únicamente hay que cerciorarse de que no contengan caracteres chinos.

Por defecto, se descargan las últimas versiones del Java SDK, JS SDK, Previewer y Toolchains. Cuando al acuerdo de licencia aparezca únicamente se le da clic en aceptar. Posterior a la descarga del SDK, dar clic en Terminar o Finish para acceder a la página de bienvenida de DevEco Studio.

## Crear un proyecto

Luego de que se abra la pantalla de bienvenida, se mostrarán tres opciones del lado izquierdo; Crear proyecto (**Create Project**), Abrir proyecto (**Open Project**) y Obtener de VCS (**Get from VCS**), de estas opciones se selecciona la opción de "**Create Project**". Al hacerlo se nos abrirá una ventana con diversas plantillas para escoger, estas plantillas incluyen lenguajes como Java, C++ y JS.
Posteriormente se debe seguir el asistente de configuración del proyecto en el que es posible elegir entre servicio o aplicación, el nombre del paquete, el lugar en el que se guardará el proyecto, la versión compatible de API, el tipo de dispositivo para el que se va a desarrollar y la opción de mostrar en el Centro de Servicio.

## Probar las aplicaciones en emuladores o dispositivos reales remotos

### Probar en emuladores o dispositivos remotos

Para establecer el método por el cuál se ejecutarán los programas que se desarrollen es necesario dirigirse a **Tools**, posteriormente a **Device Manager** y esto abrirá un panel de inicio de sesión. Es necesario iniciar sesión con la cuenta verificada de desarrollador Huawei y después de haberse logueado se da clic en **Allow**.

Posteriormente, se desplegará una lista de dispositivos, entre los cuales se encuentran teléfonos, televisores, tablets, entre otros. Al dar clic en cualquiera de ellos, se desplegarán los diversos modelos, basta con dar clic en el símbolo de reproducir para que el programa se ejecute en el dispositivo seleccionado.


### Probar en dispositivos reales


Ahora bien, para ejecutar el proyecto en un dispositivo real es necesario realizar unas configuraciones previas ya que sin ellas no es posible realizar las pruebas.

#### Configurar inicio de sesión

Inicialmente, se debe establecer la configuración para que se inicie sesión en nuestra cuenta de Huawei, ya que es necesario para realizar pruebas en dispositivos reales y que Huawei pueda supervisar los proyectos que se llevan a cabo acorde a sus regulaciones y normas.

Como primer paso, en DevEco Studio es necesario acceder a la sección de "File". Una vez en ese directorio, seleccionamos la opción "Project Structure". Al hacerlo, se desplegará una ventana con dos secciones del lado izquierdo; "Project" y "Modules", en la pestaña "Project", la cuál está seleccionada desde que se abre la ventana, se vislumbran tres secciones; "Basic Info", "Dependencies" y "Signing Configs". Seleccionamos esta última opción. Al hacerlo, se desplegará la siguiente ventana:

![Pantalla Inicio De Sesion Inicial](../../Imagenes/SignInScreen.png)

Como se puede apreciar en la imagen, están seleccionadas ambas opciones, "Support HarmonyOS" sirve para que DevEco Studio gestione las APIs adecuadas así como las funcionalidades específicas para optimizar la experiencia del usuario con todos los dispositivos que utilizan HarmonyOS. Por otro lado, la segunda opción seleccionada, es para que DevEco Studio gestione los diferentes certificados y autenticaciones de manera automática. Desafortunadamente, para todos los desarrolladores que se encuentran fuera de la China Continental, esta opción no funciona de manera adecuada, por lo cuál es necesario deselecionar la opción que sirve para generar automáticamente los inicios de sesión. Al hacerlo, se nos desplegará la siguiente pantalla:

![Pantalla Inicio De Sesion Manual](../../Imagenes/SignInScreen2.png)



##### Creación de archivo .p12 y .csr

Ahora bien, en el caso de "Store File(\*.p12)" y "Certpath File(\*.cer)", se pueden crear desde DevEco Studio. Para ello, se debe cerrar la ventana actual y seleccionar el apartado "Build" en DevEco, de la lista de opciones, hay que seleccionar "Generate Key and CSR".

![Pantalla para Generar Credenciales](../../Imagenes/GenerateKeys.png)


###### Creación archivo .p12

Como primer paso, hay que generar el archivo p12. Para ello, dado que no se cuenta con ningún archivo de este tipo generado con anterioridad, es necesario dar clic en "New". Al hacerlo, se desplegará la siguiente ventana:

![Crear el locker donde se almacena el archivo](../../Imagenes/KeyFileGeneration.png)

A continuación, dar clic en el botón de la carpeta, a lo cuál se desplegará la siguiente ventana:

![Asignar carpeta donde se guarda la llave](../../Imagenes/KeyFileGeneration2.png)

Aquí únicamente hay que seleccionar la ubicación en la que se desea guardar el archivo así como el nombre que llevará el mismo, una vez que estos datos han sido completados, dar clic en Ok.
Al hacerlo, nuevamente se mostrará la pantalla "Create Key Store", en la cuál, únicamente se debe establecer la contraseña con la que se desea proteger el archivo. Una vez llenados los tres campos, dar clic en Ok

Ahora bien, al hacerlo, la pantalla que se desplegó al inicio se verá así:

![Llenar los campos faltantes para el archivo .p12](../../Imagenes/KeyFileGeneration3.png)

Ahora, únicamente resta terminar de llenar los campos. En el caso del Alias, es el nombre con el cuál la llave se identificará a sí misma en el archivo que se está generando. Simplemente se le asigna un nombre, es importante mencionar que este nombre se debe recordar ya que servirá para pasos posteriores. Finalmente, en la sección de "Certificate", se llena al menos un campo para que permita avanzar a la siguiente fase, en este caso, se llenará "Country Code" con las letras MX, que corresponden al código de país de México. Una vez realizados estos pasos, dar clic en Next.

Al hacerlo, se desplegará la siguiente ventana:

###### Creación de archivo .csr

![Llenado de campos para archivo .csr](../../Imagenes/CRSFileGeneration.png)

En esta ventana, únicamente se debe dar clic en el icono de carpeta del apartado CSR file. Al hacerlo, se nos desplegará la siguiente pantalla, la cuál, es la misma que se desplegó al crear el archivo p12 con la única diferencia de que ahora se generará un archivo CSR.

![Seleccionar carpeta para guardar archivo .csr](../../Imagenes/CRSFileGeneration2.png)

Únicamente se selecciona la ubicación y nombre del archivo y se da clic en Ok. Al hacerlo, simplemente dar clic en el botón "Finish". De esta manera, se han creado dos de los cuatro archivos necesarios para conducir pruebas en un dispositivo real o físico.


Ahora bien, para el último archivo, es decir, el archivo "Profile File(\*.p7b)", es necesario acceder a la cuenta de [App Gallery Connect](https://developer.huawei.com/consumer/en/service/josp/agc/index.html,,AppGalleryConnect). En este punto del tutorial, ya se debería de contar con una cuenta de desarrollador autorizado de AppGallery Connect. En el caso de no contar con una, consultar [el siguiente enlace](https://developer.huawei.com/consumer/en/training/course/video/C101675066353044075).

Una vez iniciada la sesión en la cuenta de AppGallery Connect, la pantalla se verá así;

![Pantalla de inicio de AppGallery Connect](../../Imagenes/AppGalleryConnectMainPage.png)

###### Crear proyecto en AppGallery Connect

Como primer paso, dar clic en "My Projects", al hacerlo se desplegará la siguiente pantalla:

![Pantalla inicial de Proyectos en AppGallery Connect](../../Imagenes/AppGalleryConnectProjectScreen.png)

Si es la primera vez que se accede a esta sección es probable que únicamente aparezca la opción  "Add project". En este caso, dar clic en New Project. Al hacerlo se desplegará una pantalla en la que se solicita ingresar el nombre del proyecto. Se ingresa el nombre y al finalizar dar clic en Ok. Posteriormente se desplegará la siguiente pantalla:

![Pantalla de solicitud de permisos en AppGallery Connect](../../Imagenes/AppGalleryConnectProjectScreenAnalytics.png)

Para ahorrar tiempo, únicamente se desactiva esta opción y se da clic en Finish. Al hacerlo, se despliega la siguiente pantalla:

![Pantalla de información del proyecto creado en AppGallery Connect](../../Imagenes/AppGalleryConnectProjectScreenInfo.png)

Esta información es accesible en cualquier momento del proceso de desarrollo y puede ser útil para publicar la aplicación propiamente en AppGallery Connect.

Ahora bien, una vez concluido con este paso, se debe dar clic en el logo en la esquina superior izquierda de la pantalla que dice AppGallery Connect para volver a la pantalla principal.

###### Crear certificado de depuración (archivo .cer)

Una vez en la pantalla principal, dar clic en la opción "Certificates, app IDs, and profiles". Al hacerlo, se despliega la siguiente pantalla:

![Pantalla inicial de certificados de AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreen.png)

Nuevamente, si es la primera vez accediendo a esta sección, no nos saldrá nada en ninguno de los apartados. Seguidamente, el primer paso es crear un certificado para realizar pruebas con la aplicación que se está desarrollando. Este certificado permite que Huawei autorice compilar y correr el programa en diversas modalidades. 

Primero, en la misma pantalla "Certificates", dar clic en "New Certificate". Al hacerlo, se desplegará la siguiente pantalla:

![Creación de certificado de aplicación en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenDebugCert.png)

Lo único que se debe hacer es llenar los campos. Primero, se le asigna un nombre al certificado, posteriormente, seleccionar el tipo de certificado que se desea crear. Al dar clic en el campo se despliegan dos opciones:

- **Debug Certificate:** Certificado para realizar pruebas a la aplicación.
- **Release Certificate:** Certificado para publicar la aplicación en AppGallery Connect

En este caso, seleccionar la opción para debuguear. Finalmente, se solicita un archivo CSR. Este archivo ya fue creado en el apartado x. Al dar clic en este campo, se abrirá una ventana del explorador de archivos en la cual se debe buscar la ruta en la que se guardó el certificado con extensión .csr. Se selecciona el archivo y una vez seleccionado dar click en Ok y el archivo se cargará. Una vez que los campos estén llenos dar clic en Submit. Al hacerlo, el certificado aparecerá en la pantalla actual. En la columna Operation, se presentan dos opciones; "Download" y "Revoke". Siendo la primera opción útil para descargar el archivo con extensión .cer que es el tercero de los cuatro archivos que se necesitan y la otra opción sirve para revocar o inhabilitar el certificado creado para la aplicación. Para obtener el archivo simplemente dar clic en Download y seleccionar la ruta y el nombre con la que se desea guardar dicho archivo.

###### Crear ID de aplicación

A continuación es necesario crear un ID para la aplicación que se registró en AppGallery Connect con la finalidad de que Huawei pueda supervisar la actividad de la aplicación para mantener un control de errores y mantener las tecnologías que se utilizan (si es el caso) actualizadas. Para hacerlo, es necesario dirigirse a la opción "App IDs" del lado izquierdo. Al hacerlo se desplegará la siguiente pantalla:

![Pantalla de identificadores de aplicación en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenAppID.png)

Al no tener nada registrado, dar clic en "New". Luego de hacerlo, se despliega la siguiente pantalla.

![Creación de identificador de aplicación en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenAppID2.png)

Para llenar los campos se debe realizar de la siguiente manera:

- **App Type:** Se selecciona si se está desarrollando una aplicación HarmonyOS o únicamente un servicio atómico, la diferencia suele radicar en que una aplicación tiene interfaz gráfica y un servicio no.
- **App Name:** Nombre de la aplicación con la que se desea que se guarde.
- **App Package Name:** Nombre del paquete con el que se desea guardar la aplicación. Este nombre debe ser algo como nombreDeLaApp.huawei.com, de cualquier manera, hay una pequeña guía que aparece al poner el cursor sobre el símbolo de pregunta en este campo.
- **Level 1 App-Category:** Se selecciona si se trata de una aplicación normal o de un juego.

Una vez llenados todos los campos, dar click en "Next", una vez que se realice, se desplegará la siguiente pantalla:

![Creación de identificador de aplicación en AppGallery Connect continuación](../../Imagenes/AppGalleryConnectCertificateScreenAppID3.png)

En esta pantalla, únicamente se pregunta a qué proyecto de los que están creados se desea crear el identificador, en este caso se seleccionará el proyecto Prueba y al finalizar dar click en Ok. Al hacerlo, se mostrarán algunos de los kits de Huawei que se ofrecen para incluirlos dentro de la aplicación para brindar funcionalidades especiales para el proyecto como se muestra en la siguiente imagen. 

![Selección de kits de aplicación en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenAppID4.png)

En este caso no se utilizará ninguno, por lo que simplemente se da clic en Ok. Al hacerlo, nuestro proyecto quedará registrado en la pantalla de "App IDs". Una vez con este paso realizado, se procederá a mostrar el proceso para registrar el dispositivo en el que se realizarán las pruebas.

###### Registrar dispositivo en AppGallery Connect

Finalmente, es necesario crear el último archivo, con la extensión .p7b. Para hacerlo, primero es necesario dirigirse al apartado Devices en la lista de opciones del lado izquierdo. Al hacerlo, se desplegará la siguiente pantalla:

![Pantalla de dispositivos en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenDevice.png)

Nuevamente, no existirá ningún dispositivo registrado al ser la primera vez que se entra a este apartado. A continuación, dar clic en "Add Device". Al hacerlo, se mostrará la siguiente pantalla:

![Pantalla de dispositivos en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenDevice2.png)

En el primer campo, simplemente escribir el nombre con el que se desea guardar el dispositivo. En el campo Type se desplegará una lista con diferentes opciones. A la fecha de realizado el presente tutorial, no se encuentra disponible la opción de Tablet. Por ello, se debe seleccionar "Mobile Phone". Finalmente, se solicita el UDID. Este es una serie de números y letras que identifican de manera única a cada dispositivo.

Ahora bien, en el caso de la Tablet Huawei Matepad 11.5, el procedimiento para encontrar esta cadena de caracteres es la siguiente:

1. Como primer paso es necesario conectar la Tablet a la computadora y activar la depuración por USB como se menciona en el apartado Conexión USB.
2. Una vez activada la depuración por USB, es necesario ubicar la carpeta en la cual se realizó la instalación de HarmonyOS SDK en el explorador de archivos.
3. Una vez ubicada, es necesario acceder a la ruta \\hmscore\\3.1.0\\toolchains
4. Una vez en este directorio, dar clic derecho y seleccionar la opción Abrir en Terminal.
5. Una vez en la terminal, se debe introducir el siguiente comando:

		hdc shell bm get --udid

6. Al dar enter luego de introducir el comando se mostrará el UDID del dispositivo en cuestión.

Teniendo este número a la mano es posible terminar la configuración, escribiendo o copiando y pegando toda la serie de caracteres en el campo faltante en AppGallery Connect. Una vez llenos todos los campos, dar clic en Submit. Al hacerlo, el dispositivo será agregado y ya saldrá en la pantalla actual.

###### Crear archivo .p7b

Una vez realizado este paso, ya se puede generar al archivo con extensión .p7b. Para ello, es necesario dar click en la opción "Profiles" del lado izquierdo. Al hacerlo, se desplegará la siguiente pantalla:

![Pantalla de perfiles en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenProfile.png)

En este caso, no habrá nada registrado como en los casos anteriores, así que inmediatamente se da clic en "Add". Al hacerlo, se presenta la siguiente pantalla:

![Creación de perfil en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenProfile2.png)

El primer campo, a diferencia de los campos anteriores, es necesario dar clic en la lista desplegable. Al hacerlo, se mostrarán las aplicaciones a las cuáles se les creó un App ID, es por ello que se realizó dicho paso previamente. Una vez seleccionada la aplicación a la que se le desea crear el certificado, se debe llenar el campo "Profile Name" que, en este caso, es el nombre con el que se podrá identificar el certificado. Posteriormente, se debe seleccionar si el certificado será para publicación de la aplicación (Release) o si será para realizar pruebas (Debug). En este caso, este último será el que se utilizará por ahora. Posteriormente, en el apartado "Certificate", al dar click en "Select". Al hacerlo, se mostrará la siguiente pantalla:

![Selección de certificado para el perfil en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenProfile3.png)

El certificado, es aquel que se creó en el primer paso de esta sección dentro de AppGallery Connect. En esta pantalla, simplemente se selecciona la aplicación para la cuál se hará el certificado y se da click en Ok.

Posteriormente, para el campo "Device", nuevamente se da click en "Select" y se desplegará la siguiente pantalla:

![Selección del dispositivo para el perfil en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenProfile4.png)

En esta sección, lo que se está seleccionando es el dispositivo en el cuál se desean realizar las pruebas, es por este motivo que se realizó con anterioridad el registro del dispositivo en esta sección. Basta con seleccionar el dispositivo en el que se requieren hacer las pruebas y dar clic en Ok.

La última opción o campo, es opcional seleccionarlo o no, esta opción es para cuando se requieren hacer pruebas con aplicaciones que sólo tendrán permisos para acceder a contactos o funciones básicas. Al dar clic en "Select" se muestra la siguiente pantalla:

![Selección de permisos especiales para el perfil en AppGallery Connect](../../Imagenes/AppGalleryConnectCertificateScreenProfile5.png)

En caso de requerir alguna de estas configuraciones, únicamente hay que seleccionarlas y dar click en Ok.

Una vez que todos los campos han sido llenados, tomando en cuenta la información sobre el último campo, dar click en "Add", que se encuentra en la esquina superior derecha de la pantalla.

Al hacerlo, si todo ha ido bien, se mostrará un cuadro emergente que dirá "Submitted successfully", simplemente dar click en Ok y se mostrará en la pantalla Profiles el certificado que se ha creado.

Como último paso, en la columna "Operation", dar click en "Download" y se selecciona la ruta y el nombre con el cuál el archivo será guardado.

##### Llenado de configuración de inicio de sesión en DevEco Studio

Una vez realizados todos los pasos anteriores, lo único que queda es llenar la configuración en DevEco Studio para que sea posible hacer pruebas con un dispositivo físico.

Como primer paso se debe abrir la aplicación DevEco Studio. Posteriormente dirigirse a "File" y a continuación seleccionar "Project Structure". Seguidamente dar clic en "Signing Configs". Como se puede apreciar, se nos dirige a una pestaña que ya se había mostrado en esta sección. Se deselecciona la opción "Automatically generate signature" y al hacerlo se muestra la siguiente pantalla:

![Pantalla de inicio de sesión](../../Imagenes/SignInScreen2.png)

En el primer campo, se debe buscar la ubicación del archivo con extensión .p12 que se generó dentro de DevEco Studio en los primeros pasos de esta sección del tutorial. Una vez que encontrado, seleccionarlo y dar click en Ok. En el campo "Store Password" se debe poner la contraseña que se puso al momento de crear el archivo .p12. En el campo "Key Alias" se debe poner el alias que se escribió en la creación del archivo mencionado así como la contraseña que se asignó al alias de dicho archivo. En caso de tener dudas consultar la sección "Creación Archivo .p12". En el caso tanto de "Profile File" y "Certpath file" basta con buscar la ruta de los archivos que se descargaron de AppGallery Connect, cada uno con su respectiva extensión. Una vez llenos todos los campos, dar click en Apply y posteriormente dar click en "Apply" y finalmente dar clic en Ok. 

Si el dispositivo está conectado a la laptop, es posible que en la parte superior derecha de la pantalla, se encuentre ya identificada la tableta por DevEco Studio como se muestra en la siguiente pantalla:

![Apartado que indica que la tablet está conectada](../../Imagenes/DevEcoTabletIdentification.png)

Cerca de los botones para ejecutar el programa se encuentra un recuadro que dice Huawei BTK-W09. Es posible que este identificador cambie de dispositivo en dispositivo, sin embargo, esto indica que la tablet está lista para usarse. 

Para correr el programa de prueba, basta con dar click en el botón verde al lado del recuadro mencionado anteriormente y la aplicación se podrá ver en el dispositivo físico Huawei.

Es posible que la aplicación que se muestre se vea de la siguiente manera:

![Pantalla de aplicación por defecto de DevEco Studio](../../Imagenes/DefaultAppScreenShot.jpg)

Como se puede apreciar en la imagen, no se muestra nada. Para enmendar esta situación, copiar y pegar el siguiente código en el archivo entry/src/main/ets/MainAbility/pages/index.ets

		@Entry  
		@Component  
		struct Index {  
			  @State message: string = 'Hello World'  
  
			  build() {  
			    Column() {  
			      Text(this.message)  
			        .fontSize(50)  
			        .fontWeight(FontWeight.Bold)  
			        .textAlign(TextAlign.Center)  
			        .padding(20)  
			    }  
			    .width('100%')  
			    .height('100%')  
			    .backgroundColor(Color.White)   
			    .alignItems(HorizontalAlign.Center)    
			    .justifyContent(FlexAlign.Center)  
			  }  
			}

Una vez que se ha realizado, apretar el botón cuadrado rojo que se encuentra en la parte superior derecha de DevEco Studio para terminar la ejecución del programa. Una vez que se detenga volver a correr el programa. Al hacerlo, el programa se verá de la siguiente manera:

![Pantalla del código modificado](../../Imagenes/DefaultAppScreenShotClear.jpg)

De esta manera, se ha configurado el inicio de sesión y ahora es posible realizar pruebas desde un dispositivo físico para todos los programas que se deseen realizar.


#### Probar en celular o tablet 

##### Conexión USB

Para ejecutar los programas en esta modalidad es necesario activar el modo desarrollador primero en el dispositivo que será utilizado para realizar las pruebas ya que en este apartado es en el que se encuentra la opción de activar el Debugueo por USB. Para activar el modo desarrollador se deben de seguir los siguientes pasos:

1. Abrir la configuración.
2. Abrir el apartado Acerca de este Dispositivo.
3. Tocar el Número de Compilación varias veces de manera rápida hasta que se despliegue el mensaje "Ahora eres desarrollador".
4. Desde la pantalla de configuración seleccionar Sistema y Actualizaciones.
5. Opciones del desarrollador.
6. Activar la Depuración por USB.

Luego de realizar estos pasos conectar a la computadora el celular o tablet por medio de cable USB, cuando en la tablet o celular se despliegue el mensaje preguntando qué se quiere hacer, seleccionar Usar USB para Transferir Archivos, al seleccionar esta opción, se desplegará un mensaje en el dispositivo requiriendo permiso para realizar dichas transferencias, cuando esto ocurra, dar clic en Ok. Ahora bien, en la computadora, en la barra superior seleccionar **Run** y posteriormente escoger la opción "**Run nombreDelPrograma**". Al realizar esto, DevEco Studio comenzará a construir e instalar el programa en el dispositivo y una vez que haya terminado se ejecutará automáticamente.

##### Conexión por IP

Para que las aplicaciones funcionen con este método, es necesario que tanto la computadora como el dispositivo se encuentren conectados a la misma red Wifi. A continuación, es necesario tener a la mano la dirección IP del dispositivo en el que se realizarán las pruebas.
El puerto 5555 en el dispositivo viene desactivado por defecto. Para activarlo es necesario conectarlo por USB y posteriormente ingresar el siguiente comando para habilitar el puerto:

		hdc tmode port 5555

Una vez hecho este procedimiento, en la barra superior de DevEco seleccionar **Tools**, luego **IP Connection**, posteriormente se ingresa la dirección IP del dispositivo que servirá para testear la aplicación. Le damos clic el botón de ejecutar y una vez que la conexión se realice, el estatus del dispositivo en la computadora cambiará a En Línea. Para ejecutar el programa, basta con seguir los mismos pasos que con el método de conexión por USB.

[Volver al Índice](../Acerca%20de%20Harmony%20OS.md)
[Volver al inicio](../../Bitácora%20de%20Proyecto.md)
