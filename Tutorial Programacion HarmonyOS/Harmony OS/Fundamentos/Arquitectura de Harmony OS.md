Es importante comprender la arquitectura del sistema operativo ya que esto permitirá desarrollar aplicaciones de manera más completa y dará pistas de la ubicación de posibles errores que se encuentren en el futuro en el proceso de desarrollo.

La arquitectura de Harmony OS se basa en capas, las cuales se mencionan a continuación en orden ascendente:

1. Capa del [[Kernel]]
2. Capa del servicio del sistema
3. Capa de [[Framework]]
4. Capa de aplicación

A continuación se muestra una imagen que ilustra de manera detallada dicha arquitectura.

![[ArquitecturaHarmonyOS.png]]


Las funciones del sistema se encuentran representadas por niveles, de sistema a sub-sistema y a su vez, de función a módulo. Esto proporciona una ventaja en el proceso de despliegue ya que las funciones, módulos o elementos del sub-sistema que no se requieran pueden ser extraídos dependiendo de las necesidades de cada dispositivo.

## Capa o sub-sistema de [[Kernel]]

En esta capa, Harmony OS utiliza un diseño multi-kernel, esto se debe a que dependiendo del sistema que utilice el dispositivo que esté interactuando con las aplicaciones, es el kernel que utilizará. Este sub-sistema brinda las capacidades básicas de funcionamiento a las capas superiores tales como procesamiento y manejo de hilos, manejo de memoria, sistema de archivos, administración de redes y manejo de periféricos.

### Sub-sistema de [[Driver]]

En este sub-sistema se hace uso de Hardware Driver Foundation (HDF), a grandes rasgos, este es el gestor de drivers del sistema operativo y es la base sobre la cuál se permite tener un ecosistema abierto a diversos dispositivos con HarmonyOS. Permite el acceso unificado de dispositivos periféricos y brinda los cimientos para la gestión y desarrollo de drivers.

## Capa de servicios del sistema

Esta capa del sistema provee todas las capacidades necesarias para que Harmony OS funcione de manera adecuada, incluidas capacidades básicas para todos los dispositivos y capacidades enfocadas a ciertos dispositivos. A continuación se mencionarán los diferentes set de sub-sistemas que se encuentran en esta capa:

- Set de sub-sistema de capacidades básicas del sistema
	- [[Programador o Planificador Distribuido]]
	- [[Gestor de datos distribuido]]
	- [[Soft Bus Inteligente]]
	- [[Intérprete Ark multi lenguaje]]
	- [[Entrada Multimodal]]
	- Gráficos
	- Seguridad
	- Inteligencia Artificial
	- Utilidades

- Set de sub-sistema de servicios básicos de software
	- Eventos comunes y notificaciones
	- Telefonía
	- Multimedia
	- [[DFX]]
	- [[MSDP&DV]]
	- Entre otros

- Set de sub-sistema de servicios de software mejorados/especializados
	- Servicio dedicado a Smart TV's
	- Servicio dedicado a wearables
	- Servicio dedicado a dispositivos con IoT

- Set de sub-sistema de servicios de hardware
	- Ubicación
	- Hardware dedicado a gestor de datos distribuido
	- Hardware dedicado a wearables
	- Hardware dedicado a IoT

Estos sub-sistemas pueden ser divididos a su vez en funciones, estas funciones, son adecuadas por el sistema dependiendo del escenario de despliegue para dispositivos particulares.


## Capa de Framework

Esta capa es aquella que nos brinda las capacidades para desarrollar aplicaciones en Harmony OS, cuenta con un framework de aplicación y un framework de capacidades, estas están adaptadas a los diferentes lenguajes en los que se desarrolle, estos pueden ser:

- Java
- C
- C++
- JavaScript

A su vez, en el caso de Java y JavaScript, se tienen frameworks [[UI]], de igual manera, se brindan [[API]]s para el desarrollo de servicios de software y hardware en múltiples lenguajes, estas APIs varían dependiendo de los componentes que tenga cada dispositivo.


## Capa de aplicación

En esta capa se permite desarrollar aplicaciones impulsadas por Habilidades de Función (FA) y Habilidades de Partícula (PA) que se basan en la lógica que provee la capa de framework. Estas dos unidades, son las unidades básicas de las aplicaciones en HarmonyOS cuyo objetivo es implementar funcionalidades específicas.

Una aplicación puede tener una o más FAs o PAs, la diferencia entre ambas unidades es que una FA tiene interfaz gráfica de usuario, generalmente se encargan de gestionar lo que se ve en la pantalla y la forma en la que se interactúa con la aplicación.  Por otro lado, una PA es una parte de la aplicación que realiza tareas en segundo plano y no necesariamente muestran nada al usuario de manera directa.

Ahora bien, una aplicación se programa para que contenga las funcionalidades necesarias para funcionar en un celular, ahora bien, si la aplicación se descarga en otro dispositivo, las funciones que se descargarán y cargarán únicamente serán las que los componentes del dispositivo permitan utilizar, lo cual agiliza el proceso tanto de desarrollo como de consumo para el usuario. 

[Volver al Índice](<Acerca de Harmony OS>)
[Volver al inicio](<Bitácora de Proyecto>)
