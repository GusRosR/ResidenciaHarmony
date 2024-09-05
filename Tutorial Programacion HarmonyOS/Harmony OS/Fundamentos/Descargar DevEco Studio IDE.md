
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

[Volver al Índice](<Acerca de Harmony OS>)
[Volver al inicio](<Bitácora de Proyecto>)
