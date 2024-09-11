
## ¿Cómo funciona el servicio? (A nivel conceptual)

1. El usuario elige iniciar sesión a la aplicación por medio del ID
2. La aplicación envía una solicitud al SDK para obtener un código de autorización
3. El SDK envía la solicitud para obtener el código al Núcleo de HMS o bien, el APK
4. HMS Core envía esta solicitud al servidor de cuentas
5. HMS Core despliega la pantalla del servidor de cuentas donde expresamente se notifica al usuario que se está apunto de solicitar un código
6. Una vez dada la autorización, el servidor de cuentas le devuelve al APK el código
7. A su vez, el APK brinda el código al SDK y entonces el Account Kit devuelve el código a la aplicación
8. Posteriormente, la aplicación envía el código al servidor de aplicaciones
9. El servidor mencionado solicita al servidor de cuentas el token de acceso, token de actualización y token de identificación
10. El servidor de cuentas devuelve los tokens mencionados

## ¿Cómo funciona el servicio? (A nivel código)

Como primer paso es necesario crear un objeto AccountAuthParams y se le pasan los parámetros que utilizará. De la siguiente manera:

nombreDeVariable = new AccountAuthParamsHelper(AccountAuthParams.x

[Volver al índice](../Acerca%20De%20HMS.md) \n
[Volver al inicio](../../Bitácora%20de%20Proyecto.md)
