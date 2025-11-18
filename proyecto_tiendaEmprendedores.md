# Proyecto de Estudio

    
**“Tienda de emprendedores regionales”**

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:

- Aquino, Ruth.
- Rodriguez Antorena, Milo Tahiel.
- Rojas, Karen Denise.
- Sandoval Maria Victoria
- Soto, Belen E.

**Año**: 2025

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

El caso de estudio seleccionado para este trabajo es una Aplicación Web de E-commerce,
orientada a brindar un espacio de comercialización a los emprendedores regionales de la
ciudad de Corrientes Capital. El sistema está diseñado para facilitar la promoción, gestión y
venta de productos locales, con un enfoque inclusivo y social que favorezca la digitalización de
pequeños negocios.
Este sistema se ocupa específicamente de:

● Gestionar los usuarios registrados, distinguiendo entre emprendedores, clientes y
administradores de la plataforma.

● Permitir a los emprendedores publicar, editar y eliminar sus productos, manteniendo
información relevante como nombre, descripción, precio, stock y categoría.

● Facilitar a los clientes la exploración de productos, la conformación de un carrito de
compras y la posterior generación de órdenes de compra.

● Administrar las ventas realizadas, con acceso tanto para el cliente (historial de compras)
como para el emprendedor (registro de ventas).

● Integrar y controlar los métodos de pago disponibles, garantizando transacciones
seguras.

● Ofrecer distintas opciones de entrega de los productos adquiridos (envío, retiro en punto
de entrega o retiro personal). OPCIONAL

● Posibilitar la notificación automática a los emprendedores ante ventas o consultas
recibidas.

### Alcance
El alcance de la plataforma abarca la comercialización de productos en el ámbito regional,
permitiendo que los emprendedores locales tengan mayor visibilidad y alcancen una base de
clientes más amplia.
Por otra parte, se establecen los siguientes límites:

● No se contemplan funcionalidades de reseñas o valoraciones de productos por parte de
los clientes.

● No se implementa la gestión de devoluciones ni de proveedores externos.

● La administración de campañas de marketing digital, difusión o soporte externo queda
fuera del alcance del sistema

### Definición o planteamiento del problema
En una aplicación donde clientes y emprendedores interactúan, registran cuentas y gestionan productos, resulta indispensable contar con un sistema de base de datos que centralice toda la información que la app utiliza. Sin embargo, sin una estructura adecuada, los datos sobre emprendedores, clientes, productos, precios, stock y ventas pueden quedar dispersos o mal integrados, lo cual genera fallas en las funciones de la app, errores en las transacciones y dificultades para garantizar una experiencia confiable al usuario.
Dado que todas las operaciones como registro, publicación de productos, creación de carritos, compras y pagos se realizan directamente desde la app, surge el siguiente problema de investigación:
¿Cómo diseñar una base de datos que permita centralizar y controlar la información utilizada por la app, garantizando integridad en las operaciones, consistencia en los datos y trazabilidad completa de las transacciones entre emprendedores y clientes?

### Objetivo del Trabajo Práctico
El objetivo del trabajo práctico es desarrollar una base de datos que permita gestionar de manera eficiente la información de una aplicación donde emprendedores publican sus productos y los clientes realizan compras, controlando usuarios, productos, categorías, carritos, facturación y pagos, y facilitando la consulta y generación de reportes relacionados con las operaciones comerciales de la plataforma.

### Objetivo Generales
Diseñar e implementar un sistema de base de datos que centralice la información utilizada por la app Tienda de Emprendedores, garantizando la integridad de los datos, la consistencia de las operaciones y la trazabilidad completa de cada venta realizada entre clientes y emprendedores.

### Objetivos Específicos
● Registrar y mantener información detallada sobre emprendedores, clientes, productos, categorías, precios y stock.

● Controlar las operaciones comerciales de la app mediante el registro de carritos, items de compra, facturación y pagos.

● Gestionar el estado del proceso de compra, desde la creación del carrito hasta el registro del pago y la confirmación de la venta.

● Permitir consultas y generación de reportes que faciliten el análisis de productos, ventas, emprendedores y actividad comercial dentro de la plataforma.

● Garantizar la integridad y consistencia de los datos mediante el uso de transacciones y transacciones anidadas en operaciones críticas como la venta.

● Optimizar el rendimiento del sistema utilizando vistas e índices para acelerar las consultas más frecuentes realizadas por la app.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL
El desarrollo del sistema de gestión Tienda de Emprendedores se apoya en una serie de herramientas fundamentales del motor SQL Server que permiten garantizar eficiencia, integridad y organización en el manejo de datos. En este proyecto se aplican específicamente cinco componentes esenciales: procedimientos almacenados, vistas, índices, transacciones y transacciones anidadas.

Los procedimientos almacenados permiten encapsular instrucciones SQL que realizan tareas específicas, como insertar productos, registrar ventas, actualizar registros o consultar información compleja. Su uso reduce la duplicación de código, mejora el rendimiento y asegura que las operaciones críticas se ejecuten de manera uniforme y controlada.

Las vistas cumplen un rol importante en la simplificación del acceso a la información. Son consultas predefinidas que presentan datos provenientes de una o varias tablas, facilitando la obtención de información sin necesidad de escribir consultas complejas. En un sistema comercial como Tienda de Emprendedores, las vistas se utilizan para mostrar productos, precios, facturación o reportes sin exponer directamente la estructura interna de la base de datos, contribuyendo a mayor seguridad y claridad en la consulta de datos.

Los índices permiten optimizar el rendimiento de las búsquedas y mejorar la velocidad de ejecución de consultas que utilizan filtros, ordenamientos o claves importantes. Al crear índices en columnas estratégicas, como claves primarias, claves foráneas o campos que se consultan frecuentemente, el sistema puede responder más rápido, lo cual es esencial cuando la base de datos incrementa su volumen de información debido al crecimiento del negocio.
El uso de transacciones garantiza que los procesos que involucran múltiples operaciones se ejecuten de forma segura y consistente. Una transacción asegura que una serie de instrucciones SQL se comporte como una unidad indivisible: o se realiza completamente o se anula por completo. Esto es crucial en procesos comerciales como la creación de facturas, el registro de pagos o la actualización del inventario, donde un error podría dejar los datos en un estado incoherente si no existiera este mecanismo.
Por último, las transacciones anidadas permiten estructurar procesos internos dentro de una transacción mayor. Esto proporciona un control adicional sobre cada etapa del proceso y permite manejar errores específicos en pasos intermedios. Su uso resulta especialmente valioso cuando una operación principal depende de varios subprocesos que también deben validarse o revertirse en caso de fallas. Su aplicación en el proyecto demuestra un manejo avanzado de la integridad transaccional.
La integración coherente de procedimientos almacenados, vistas, índices y mecanismos transaccionales permite construir un sistema seguro, eficiente y preparado para soportar operaciones comerciales reales, garantizando la integridad de los datos y la escalabilidad futura del proyecto.

**TEMA 1 "Procedimientos y Funciones almacenadas "** 
Conceptos:

Procedimientos Almacenados:
Conjunto de sentencias (instrucciones) SQL que se guardan como un objeto de  Base de Datos y se puede ejecutar en un solo comando. Se usan para ejecutar operaciones completas (inserción,eliminación,actualización), pueden aceptar parámetros de entrada, salida permitiendo modificar los valores que se devuelven.
                                             Ventajas
Reduce la repetición de código
Facilita la organización y mantenimento del código
Mejora la seguridad
Aumenta el rendimiento porque se ejecuta las operaciones en el servidor de la base de datos
                                             Tipos
.User-defiend:
Un procedimiento definido por el usuario se puede crear en una base de datos definida por el usuario o en todas las bases de datos del sistema excepto en la base de datos RESOURCE	
.Temporary:
Los procedimientos temporales son una forma de procedimientos definidos por el usuario,son como un procedimiento permanente, salvo que se almacenen en TEMPDB.
Hay dos tipos de procedimientos temporales locales y globales 
.System
Los procedimientos del sistema se incluyen con el motor de base de datos.Están almacenadas físicamente en la base de datos interna y oculta de RESOURCE ,se muestran de forma lógica en el esquema sys de cada BD definidas por el sistema y por el usuario.
                                               Ejecución
El método más común es que una aplicación o un usuario llame al procedimiento almacenado para que se ejecute automáticamente cuando se inicie una instancia.Para llamar a un procedimiento se usa la palabra clave EXECUTE o EXEC.
Los procedimientos del sistema comienzan con el prefijo “sp_ “, puesto que aparecen lógicamente en todas las bases de datos del sistema se pueden ejecutar desde cualquier base de datos sin necesidad de clasificar totalmente el nombre del procedimiento.

-Funciones Almacenadas:
Es un procedimiento que devuelve siempre un valor o tabla. No se pueden modificar directamente los datos. 
Generalmente solo recibe parámetros de entrada ya que su propósito principal es procesar datos y devolver un resultado. Se usa para realizar cálculos o transformaciones de datos que se necesitan en múltiples consultas.
                                                 Ventajas
.Programación Modular
.Ejecución más rápida
                                                   Tipos
.Funciones escalares:
Las funciones escalares definidas por el usuario devuelve un único valor de datos del tipo definido en la clausura RETURNS .En una función escalar insertada el valor escalar es el resultado de una sola instrucción
.Funciones con valor de tabla:
Las funciones con valor de tabla definidas por el usuario devuelve un tipo de dato tabla,no tienen cuerpo,la tabla es el conjunto resultado de una sola instrucción SELECT
                                                 Limitaciones
Las funciones definidas por el usuario no se pueden utilizar para realizar modificaciones en el estado de la base de datos.
No pueden devolver varios conjuntos de resultados,no admite try…catch
No pueden llamar a un procedimiento almacenado, no pueden usar tablas temporales

                                     Diferencias:
<img width="635" height="427" alt="{9531CFB6-3B30-416C-8A74-6C2EC45F86B7}" src="https://github.com/user-attachments/assets/2a54a35b-08a5-40d7-a1a9-e0e1589e1596" />
 Procedimientos almacenados sobre la tabla Producto
Se definieron procedimientos almacenados para Insertar, Modificar y Eliminar productos:
	Sp_insertar_producto
<img width="884" height="353" alt="{9F031F37-0747-4AFE-82DD-22DD05B02BDB}" src="https://github.com/user-attachments/assets/daf077a6-1111-44b8-b3cf-787ba01e569e" />
Sp_modificar_producto
<img width="1099" height="462" alt="{F5976CBA-F069-4B63-A28A-29ED83C5E9F4}" src="https://github.com/user-attachments/assets/d65c0362-b4b2-44c4-a360-2663d8208eb8" />
sp_eliminar_producto
<img width="923" height="207" alt="{8B6C9D57-C2E4-4DB2-9BA6-0B611A14A2D9}" src="https://github.com/user-attachments/assets/0794734d-141a-40c2-9aea-5b4808f861c5" />
Previamente se insertó un lote de registros en la tabla Categoría para contar con categorías válidas para referenciar desde Producto.
<img width="906" height="211" alt="{05D7CA24-7846-46FE-8A4D-1C024D841607}" src="https://github.com/user-attachments/assets/27187b4f-f632-4060-8973-3a1cd22bff72" />
Se ejecutaron los procedimientos con EXEC para:
	Insertar varios productos (por ejemplo, Pastafrola, Bolso, Lámpara, etc.).
<img width="663" height="499" alt="{1142CEAA-AC09-42B9-B4C6-5A8809D63195}" src="https://github.com/user-attachments/assets/2ea5d52e-0b89-4ab1-8e17-ee49daf3ed86" />
Modificar un producto existente cambiando nombre, descripción, stock, precio y categoría.
<img width="1031" height="211" alt="{C3F06530-699A-4640-8947-FF4A65F6A4E4}" src="https://github.com/user-attachments/assets/135b72d4-afb4-4ad2-b47c-20b9ee40bdaa" />
Eliminar un producto a partir de su id_producto.
<img width="827" height="100" alt="{8989A13C-0410-44FB-885C-79459F7DB13B}" src="https://github.com/user-attachments/assets/ed2a1459-0033-405c-b515-c9eb538c9cf1" />
Se comparó la inserción directa con INSERT INTO Producto... frente a la inserción mediante el procedimiento sp_insertar_producto, activando SET STATISTICS TIME y SET STATISTICS IO para medir tiempos y lecturas de disco, observando que si bien los tiempos son similares para un único registro, el uso de procedimientos aporta organización, reutilización y centralización de la lógica.
 inserción directa con INSERT INTO
![Imagen de WhatsApp 2025-11-07 a las 11 46 38_d2a4ce7a](https://github.com/user-attachments/assets/2c4a5744-88ed-4736-9049-6defd6e7fa90)
 inserción mediante el procedimiento sp_insertar_producto
![Imagen de WhatsApp 2025-11-07 a las 11 47 18_76767ae4](https://github.com/user-attachments/assets/e3e7d30b-c988-4cb8-aad0-8d63c1f330c1)
Conclusión
Ambos métodos producen el mismo resultado en cuanto a operaciones de lectura (mismo número de logical reads), pero el procedimiento almacenado muestra un ligero aumento del tiempo de ejecución total (elapsed time) debido al proceso adicional de compilación y llamada del procedimiento.
Sin embargo, los procedimientos almacenados ofrecen ventajas importantes a largo plazo:
Mejor seguridad y mantenimiento, ya que el código SQL se centraliza en el servidor.
Mejor rendimiento en ejecuciones repetidas, porque SQL Server almacena el plan de ejecución en caché.
Facilitan la reutilización y consistencia del código frente a operaciones directas repetitivas.
Funciones almacenadas y comparación con consultas directas
Aunque el foco principal está en procedimientos, también se implementaron algunas funciones almacenadas para complementar la lógica:
Se crearon funciones escalares como:


fn_total_stock() → suma el stock total de la tabla Producto.
<img width="1016" height="229" alt="{435B4D18-1880-4EAD-B405-88F9014C305B}" src="https://github.com/user-attachments/assets/77f17765-0207-4c94-b64e-1e429b3d55c1" />
fn_total_categoria(@id_categoria) → calcula el valor total de inventario por categoría (stock * precio).
<img width="737" height="213" alt="{7896A4E0-A896-4CC7-B3A5-56FD5FC8856D}" src="https://github.com/user-attachments/assets/fb6a45a0-1763-4953-bec8-0784a85d89c6" />
fn_aplicar_aumento(@id_producto, @porcentaje) → calcula el nuevo precio de un producto aplicando un porcentaje de aumento.
<img width="959" height="273" alt="{C73AFF75-840A-445F-A211-EB8BB28BAB91}" src="https://github.com/user-attachments/assets/a60cb5d1-ee0d-48e2-8e6c-7e0cbf7f6278" />
Se probaron las funciones con SELECT y se comparó:
<img width="670" height="367" alt="{7304A74E-8FB1-48CA-8223-828B6B9C8BA7}" src="https://github.com/user-attachments/assets/4cbc9f02-96cd-4a80-b35c-71bedd63fb5c" />
Una consulta directa SELECT SUM(precio * stock)
<img width="223" height="88" alt="{137FC5C9-47B6-4393-85D1-0BBCFE863FCC}" src="https://github.com/user-attachments/assets/41b5d6cc-00c7-4f18-ac1b-12d3eac6dba0" />
Versus SELECT dbo.fn_total_categoria(6)
<img width="269" height="77" alt="{0EC3C68B-F0C6-452C-B48B-8D8C2EE1B9BE}" src="https://github.com/user-attachments/assets/9fb64660-138f-4701-b214-dc264dd34f6f" />
usando nuevamente SET STATISTICS TIME/IO para observar que el costo de lectura es similar, pero las funciones permiten encapsular lógica y reutilizar cálculos.
directa
![Imagen de WhatsApp 2025-11-07 a las 12 02 07_70799e3c](https://github.com/user-attachments/assets/990153dc-3d74-426f-9486-3bd1ce5dd2e8)
Funcion 
![Imagen de WhatsApp 2025-11-07 a las 12 01 42_1c26299d](https://github.com/user-attachments/assets/d5097f8a-7ac6-4254-80ac-93c80d00e918)

Conclusión:
Ambos métodos tuvieron un rendimiento similar. No se realizaron lecturas físicas en disco y los tiempos de CPU fueron mínimos.
La inserción directa fue ligeramente más rápida (0 ms frente a 7 ms), pero la diferencia es insignificante para un solo registro.
El uso del procedimiento almacenado es igualmente eficiente y ofrece mayor modularidad y reutilización del código.
> Acceder al scripts [scripts-> tema_1](script/Procedimientos y funciones almacenadas_script.sql)

**TEMA 2 " ----- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.
> Acceder al scripts [scripts-> tema_2](script/Tema5_optimización)
**TEMA 3 "Manejo de transacciones y transacciones anidadas"** 
Una transacción SQL es una secuencia de una o más operaciones de base de datos tratadas como una unidad de trabajo indivisible. Su finalidad es asegurar que los cambios en la base de datos se apliquen de manera coherente y sin corrupción de los datos.

Propiedades ACID de las transacciones: Las transacciones se rigen por las propiedades ACID, que garantizan su fiabilidad y consistencia:

Atomicidad: La transacción se ejecuta completamente o no se ejecuta en absoluto. Si alguna operación falla, todas se revierten.

Coherencia: La base de datos pasa de un estado válido a otro, respetando restricciones como claves primarias, foráneas, y reglas de negocio.

Aislamiento: Las transacciones concurrentes no interfieren entre sí.

Se establecen niveles de aislamiento como READ COMMITTED, REPEATABLE READ y SERIALIZABLE para equilibrar rendimiento y consistencia.

Durabilidad: Una vez confirmada, la transacción permanece almacenada incluso ante fallos del sistema, gracias al uso de registros en medios persistentes.
Estas propiedades conforman el núcleo del modelo transaccional y aseguran que el sistema mantenga la integridad lógica de los datos.

**Implementación de transacciones SQL**
El control de transacciones en SQL se realiza mediante las instrucciones básicas:

BEGIN: inicia una transacción.

COMMIT: confirma los cambios realizados.

ROLLBACK: revierte los cambios ante un error o fallo.

Estos comandos permiten agrupar operaciones, controlar errores y mantener la coherencia de los datos. Su correcta aplicación es esencial en procedimientos almacenados y aplicaciones críticas que dependen de la integridad transaccional.
Desafíos comunes en el manejo de transacciones.
El uso de transacciones presenta desafíos relacionados con la concurrencia, los bloqueos (deadlocks) y la gestión de errores.
Cuando varias transacciones intentan acceder a los mismos recursos simultáneamente, pueden generar conflictos que deterioran el rendimiento o la consistencia del sistema.

Para mitigar estos problemas, se implementan mecanismos como:

Bloqueos (Locks): controlan el acceso a los datos; los bloqueos compartidos permiten lectura concurrente, mientras que los exclusivos garantizan escritura segura.

Niveles de aislamiento: determinan la visibilidad de los cambios entre transacciones y equilibran rendimiento y fiabilidad.

Puntos de guardado (SAVEPOINT): permiten realizar retrocesos parciales, evitando la anulación total de una transacción en caso de error

**Transacciones anidadas y puntos de guardado**
Las transacciones anidadas son transacciones dentro de una transacción principal. Permiten dividir una operación compleja en subtransacciones independientes, mejorando la modularidad y el control de errores.
 Aunque no todos los sistemas de gestión de bases de datos (SGBD) las soportan de forma nativa, es posible simularlas mediante puntos de guardado, que marcan etapas intermedias dentro de una misma transacción.
 
Funcionamiento:
Se inicia la transacción principal.
Se definen puntos de guardado en pasos críticos.
Ante un error, se revierte hasta el punto de guardado, sin cancelar toda la transacción.
Finalmente, se confirma la transacción completa cuando todas las operaciones son exitosas
Este enfoque permite mayor flexibilidad y control, especialmente en procesos de múltiples etapas como inserciones masivas, actualizaciones dependientes o cálculos secuenciales.

Implementación en el proyecto:

Como primer paso se realizó un SELECT sobre de las tablas Factura, DetalleFactura y Producto para ver cuantas teniamos generadas y verificar si las transacciones implementadas se ejecutan de manera correcta.

<img width="583" height="294" alt="image" src="https://github.com/user-attachments/assets/a8aea77a-bb1c-4bee-9da9-aba9d6655797" />

Paso 1 – Transacción exitosa
En el primer caso, se desarrolló una transacción exitosa en la cual se lleva a cabo el flujo completo de una venta:

1-se genera un nuevo id_factura asegurando que no haya conflictos de concurrencia mediante el uso de bloqueos (UPDLOCK, HOLDLOCK),

2-se inserta la cabecera de la factura,


<img width="626" height="210" alt="image" src="https://github.com/user-attachments/assets/04398220-2604-41f4-9dd8-a0075f1f089b" />


3-se registra el detalle vinculando un producto, cantidad y precio unitario,


<img width="740" height="113" alt="image" src="https://github.com/user-attachments/assets/d594603f-1937-4d94-ae20-64e547a35ca9" />


4-se valida el stock disponible y se descuenta la cantidad correspondiente,


<img width="682" height="92" alt="image" src="https://github.com/user-attachments/assets/d342233b-2ef7-4c32-b876-86c578beb612" />


5-finalmente, se recalcula y actualiza el total de la factura en base al detalle cargado.


<img width="637" height="248" alt="image" src="https://github.com/user-attachments/assets/a37fb1f0-efb8-42c7-885c-8aaced3dfd46" />


Resultados: 


<img width="645" height="284" alt="image" src="https://github.com/user-attachments/assets/2539f000-36be-4de6-bd00-b3a78691dd57" />


Se comprueba que se realizó la transacción de manera correcta. Genera una nueva factura con su detalle y descontando el stock.

Todo esto se encuentra encapsulado dentro de un bloque BEGIN TRAN ... COMMIT con manejo de errores mediante TRY...CATCH. De esta manera, si cualquier parte del proceso fallara, la transacción se revertiría con ROLLBACK, pero en este escenario se comprueba su correcto funcionamiento y se verifica el resultado con consultas posteriores a las tablas involucradas.



Paso 2 – Transacción con error intencional (FK)
Se realiza un SELECT para verificar que no se produzca una modificación.

<img width="585" height="163" alt="image" src="https://github.com/user-attachments/assets/e58f345a-fb96-4b03-a0ae-686d216b51d8" />


Tenemos registradas 15 facturas.

Se intentó insertar un detalle con un id_producto inexistente (por ejemplo, 9999), generando violación de clave foránea.


<img width="758" height="406" alt="image" src="https://github.com/user-attachments/assets/f584a12b-07b0-409a-ab9a-3d455547110e" />

Resultado: 


<img width="652" height="307" alt="image" src="https://github.com/user-attachments/assets/d84d0ff5-e9cd-47e7-83bc-fcc3603f4d7a" />


No se realizó la transacción por que no hubo coincidencia, por lo tanto se mantienen las 15 facturas generadas.

Se comprobó que el CATCH ejecutó el ROLLBACK, evitando que quedara la factura “huérfana” o datos inconsistentes.

Paso 3 – Transacción con SAVEPOINT (transacción anidada)
Se inició una transacción y se insertó la factura y su detalle.


<img width="747" height="289" alt="image" src="https://github.com/user-attachments/assets/19a44afe-2f7d-477e-9fe4-d3bacf8f502c" />


Se definió un SAVE TRAN SP_Stock antes de validar el stock.
Si el stock era insuficiente, se ejecutó ROLLBACK TRAN SP_Stock y se lanzó un error con THROW, generando la reversión de todo el proceso.
En caso de éxito, se actualizó el stock y el total de la factura, finalizando con COMMIT.

Caso de stock insuficiente:


<img width="755" height="421" alt="image" src="https://github.com/user-attachments/assets/c8d27f4f-8a8e-4592-923a-ff582851585a" />


Resultado: 


<img width="730" height="345" alt="image" src="https://github.com/user-attachments/assets/4c96dfe9-14a9-4c60-86ed-d35b6a30ebff" />


No se generó la factura y tampoco se descontó el stock.
Caso éxito:


<img width="576" height="493" alt="image" src="https://github.com/user-attachments/assets/6457a226-71b6-47d9-b971-4108880204b7" />


Resultados:


<img width="807" height="426" alt="image" src="https://github.com/user-attachments/assets/81f5a358-642a-46b8-8577-ac466accbb4b" />

Se genera una nueva factura con el detalle y el stock actualizado.


Se registra la factura y su detalle, pero antes de impactar definitivamente el stock del producto se establece un punto de guardado. Si la cantidad solicitada supera el stock disponible, se ejecuta un ROLLBACK al SAVEPOINT y se lanza un error mediante THROW, provocando la reversión de toda la operación.
Finalmente, se realizaron consultas de verificación (SELECT TOP ... FROM Factura, DetalleFactura, Producto) para comprobar que en los casos con error no quedaban datos parciales y que la integridad se mantenía.

> Acceder al scripts [scripts -> tema 3](script/Transacciones-TransaccionesAnidadas.sql)

**TEMA 4 "  Vistas y vistas indexadas "** 
Vistas.
Una vista es una instrucción T-SQL almacenada que actúa como una fuente lógica de datos. Puede considerarse una tabla virtual cuyo contenido se genera dinámicamente cada vez que se consulta, ya que la vista no almacena datos físicamente en la base de datos salvo en el caso particular de las vistas indexadas. Su definición se basa en una sentencia SELECT, y puede involucrar una o varias tablas, simplificando el acceso a consultas complejas mediante un nombre único.  (Medina Serrano, 2015; Microsoft, 2024)

Las vistas permiten abstraer u ocultar la estructura real de las tablas, mejorar la seguridad limitando el acceso a columnas sensibles y proveer una capa de presentación más amigable para el usuario. También pueden emplearse para fines de rendimiento cuando se convierten en vistas indexadas.  (Medina Serrano, 2015)

En determinados casos, las vistas son actualizables, lo que permite realizar operaciones INSERT, UPDATE o DELETE sobre ellas. En estos casos los datos no se modifican en la vista (que no contiene valores) sino en las tablas subyacentes. Para que una vista sea actualizable deben cumplirse ciertas condiciones como: incluir las claves primarias y columnas NOT NULL de las tablas asociadas, derivar sus columnas directamente de una única tabla y evitar operaciones como agregaciones o uniones que impidan determinar en qué tabla debe aplicarse la modificación.  (Quintana, 2014)

Por el contrario, las vistas definidas con operaciones de conjuntos pueden sufrir operaciones update o delete pero no pueden sufrir operaciones insert, ya que no se puede determinar en cuál de todas las tablas se debe realizar la inserción.

Cuando se deben utilizar vistas : 
Cuando necesite presentar a un cliente la información que realmente le interesa, quitando las columnas que no contienen información de interés.  Para no mostrar la estructura de una tabla, es decir, los nombres de las columnas que la componen.

<img width="917" height="412" alt="captura_vistaSimple1" src="https://github.com/user-attachments/assets/4c4925cc-d1ea-43f3-b303-5d20cdd014ee" />
<img width="891" height="325" alt="captura_vistaSimple2" src="https://github.com/user-attachments/assets/8e812a75-52f2-49a8-8afe-439d34c2464d" />


Vistas indexadas.
Un índice puede entenderse como una estructura ordenada que almacena los valores de una o varias columnas de una tabla junto con una referencia a sus filas. Los índices pueden ser: Unique: garantizan que los valores no nulos de la clave no se repitan en la tabla. Clustered: ordenan físicamente los registros de la tabla según la clave del índice. ASC/DESC: especifican el orden físico utilizado.

El principal beneficio de los índices es que las filas quedan ordenadas por la clave de búsqueda, permitiendo algoritmos de localización más eficientes y reduciendo el coste de las operaciones SELECT. Sin embargo, incrementan el coste de las operaciones INSERT, DELETE y ciertos UPDATE, ya que SQL Server debe mantener la estructura del índice actualizada.

La creación de un índice clustered único sobre una vista transforma a dicha vista en una vista indexada. A diferencia de las vistas tradicionales, las vistas indexadas son materializadas, es decir que SQL Server calcula y almacena físicamente los resultados de la definición de la vista en el disco, manteniéndolos sincronizados con la tabla base. Esto mejora notablemente el rendimiento de consultas repetitivas, especialmente aquellas que agregan o filtran grandes volúmenes de datos, ya que se evita recalcular la consulta SELECT en cada ejecución y se reducen las lecturas lógicas y el uso de CPU.

No todas las vistas pueden ser indexadas. SQL Server exige condiciones específicas, entre ellas: Definición con WITH SCHEMABINDING, estructura determinista (sin funciones no determinísticas), ausencia de operaciones no permitidas (UNION, TOP, funciones escalar no deterministas, etc.), creación obligatoria de un índice clustered único como primer índice.

Las vistas indexadas resultan especialmente útiles en consultas de análisis sobre grandes volúmenes de datos. Sin embargo, no son adecuadas cuando las tablas base tienen una alta frecuencia de modificaciones, debido al coste adicional de mantenimiento que implican.

<img width="1068" height="451" alt="captura_vistaindexada" src="https://github.com/user-attachments/assets/5a58f8c4-80d9-4973-8be3-8abb3a6279e9" />

> Acceder al scripts [scripts-> tema 4](script/Tema4_VISTAS_V.INDEXADAS.sql)

## CAPÍTULO III: METODOLOGÍA SEGUIDA 

Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros.

 **a) Cómo se realizó el Trabajo Práctico**
Vestibulum rutrum feugiat molestie. Nunc id varius augue. Ut augue mauris, venenatis et lacus ut, mattis blandit urna. Fusce lobortis, quam non vehicula scelerisque, nisi enim ultrices diam, ac tristique libero ex nec orci.

 **b) Herramientas (Instrumentos y procedimientos)**
Para la recolección, análisis y tratamiento de la información en el desarrollo del proyecto Tienda de Emprendedores Regionales, se emplearon herramientas técnicas y fuentes documentales oficiales. A continuación, se detallan los instrumentos utilizados durante el trabajo.

**Instrumentos utilizados:**

Motor de base de datos SQL Server:
 Constituyó la plataforma central para la implementación, prueba y validación de los componentes del proyecto, incluyendo procedimientos almacenados, funciones, vistas, índices y mecanismos de transacción.


Entorno de desarrollo SQL Server Management Studio (SSMS):
 Herramienta gráfica empleada para la escritura, ejecución, monitoreo y depuración de consultas SQL, permitiendo además realizar mediciones de rendimiento mediante STATISTICS TIME e IO.


Documentación oficial de Microsoft Learn:
 Fuente principal de consulta teórica para comprender el funcionamiento, sintaxis y mejores prácticas asociadas al motor SQL Server. Aseguró la validez conceptual de los procedimientos implementados y el correcto uso de herramientas como vistas indexadas, transacciones o tipos de índices.
 





### Diagrama relacional
![diagrama_relacional](https://github.com/dovillegas/basesdatos_proyecto_estudio/blob/main/doc/image_relational.png)

### Diccionario de datos

Acceso al documento [PDF](doc/DiccionarioProyectoBD.pdf) del diccionario de datos.




## CONCLUSIONES
El desarrollo del proyecto Tienda de Emprendedores permitió aplicar de manera integrada y práctica los conceptos fundamentales del motor SQL Server, demostrando cómo cada uno de los componentes estudiados contribuye a la eficiencia, seguridad y consistencia del sistema. A través de la creación de vistas, se simplificó el acceso a datos y se facilitó la consulta de información relevante, tanto mediante vistas actualizables como mediante vistas indexadas, las cuales evidenciaron mejoras significativas en el rendimiento de consultas complejas.
El análisis de índices, especialmente mediante pruebas controladas sobre grandes volúmenes de datos, permitió comprobar cómo los índices agrupados, no agrupados y con columnas incluidas optimizan de forma notable los tiempos de ejecución y la cantidad de lecturas realizadas por el motor. Estos resultados reafirman la importancia de un diseño de índices adecuado para garantizar un sistema escalable y con buen desempeño.
Los procedimientos almacenados implementados sobre la tabla Producto demostraron la utilidad de encapsular la lógica de negocio dentro de la base de datos, permitiendo realizar operaciones de inserción, actualización y eliminación de manera segura, reutilizable y centralizada. De forma complementaria, las funciones almacenadas permitieron encapsular cálculos frecuentes, brindando resultados consistentes y fácilmente integrables dentro de consultas mayores.
Finalmente, el trabajo con transacciones y transacciones anidadas representó uno de los aspectos más críticos del proyecto, ya que permitió simular procesos reales de la aplicación como la creación de facturas, registro de detalles y actualización de stock. La implementación de TRY…CATCH, ROLLBACK, SAVEPOINT y THROW permitió validar el cumplimiento de las propiedades ACID, garantizando que ante cualquier error —ya sea por integridad referencial o disponibilidad de stock— el sistema mantenga la coherencia total de los datos.
En conjunto, todos estos elementos mostraron cómo un diseño de base de datos robusto no solo facilita las operaciones internas del sistema, sino que también asegura que la aplicación funcione de manera confiable, eficiente y preparada para escenarios reales de uso. El proyecto permitió no solo comprender la teoría, sino también aplicarla en un contexto práctico y representativo de una aplicación comercial moderna.




## BIBLIOGRAFÍA DE CONSULTA

● Microsoft. (2024). Vistas (SQL Server). Microsoft Learn. Recuperado de https://learn.microsoft.com/es-es/sql/relational-databases/views/views
● Microsoft. (2024). Crear vistas indexadas (SQL Server). Microsoft Learn. Recuperado de https://learn.microsoft.com/es-es/sql/relational-databases/views/create-indexed-views
● Quintana, G. (2014). Aprende SQL: ( ed.). Castelló de la Plana, Spain: Universitat Jaume I. Servei de Comunicació i Publicacions. Recuperado de https://elibro.net/es/ereader/unne/53252?page=154
● Microsoft. (2024a, 17 de julio). Índices. Microsoft Learn. Recuperado el 3 de noviembre de 2025, de https://learn.microsoft.com/es-es/sql/relational-databases/indexes/indexes?view=sql-server-ver17
● Microsoft. (2024b, 20 de septiembre). Índices de tablas optimizadas para memoria. Microsoft Learn. Recuperado el 3 de noviembre de 2025, de https://learn.microsoft.com/es-es/sql/relational-databases/in-memory-oltp/indexes-for-memory-optimized-tables?view=sql-server-ver16
● Microsoft. (2024c, 17 de julio). Reorganizar y volver a generar índices. Microsoft Learn. Recuperado el 3 de noviembre de 2025, de https://learn.microsoft.com/es-es/sql/relational-databases/indexes/reorganize-and-rebuild-indexes?view=sql-server-ver17

● Camuña Rodríguez, J. F. (2025). Lenguajes de definición y modificación de datos SQL. IFCT0310: (1 ed.). Antequera, IC Editorial. Recuperado de https://elibro.net/es/ereader/unne/..

● IEEE-RITA Vol. 5, Núm. 2, May. 2010.


